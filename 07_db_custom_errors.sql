/******************************************************************************
 * TYPE: domain
 * NAME: dm_error_name

 * DESC: domain for error name with format validation
 *****************************************************************************/
CREATE DOMAIN dm_err_name AS text
    CHECK (
        VALUE ~ '^([0-9a-z]+_)*[0-9a-z]+$'
    );

/******************************************************************************
 * TYPE: table
 * NAME: tb_custom_errors
 *
 * DESC: table storing custom error messages and hints
 *****************************************************************************/
CREATE TABLE tb_custom_errors (
    error_code      smallserial PRIMARY KEY,
    error_name      dm_err_name UNIQUE NOT NULL, 
    error_message   text UNIQUE NOT NULL,
    error_hint      text
);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: constraint - check
 * NAME: err_code_in_range
 *
 * DESC: check if the error code is less then 1000
 *****************************************************************************/
ALTER TABLE tb_custom_errors
    ADD CONSTRAINT err_code_in_range
    CHECK (
        error_code < 1000
    );

/******************************************************************************
 * TYPE: function - utility
 * NAME: int2err_code
 *
 * DESC: given an integer err_code return a well formatted string 
         error code with that integer
 *****************************************************************************/
CREATE OR REPLACE FUNCTION int2err_code (num_err_code smallint)
    RETURNS varchar(5)
AS $$
    BEGIN
        RETURN 'CE' || to_char(num_err_code, '999');
    END;
$$ LANGUAGE plpgsql;



/******************************************************************************
 * TYPE: function - utility
 * NAME: handle_custom_error
 *
 * DESC: given custom error details raise an exception accordingly
 *****************************************************************************/
CREATE OR REPLACE PROCEDURE handle_custom_error(
    err_code smallint,
    err_msg text,
    err_hint text
)
AS $$
    DECLARE
        str_err_code varchar(5);
    BEGIN

        IF err_msg IS NULL THEN
            err_msg := '(CE000) An unknown error occurred';
            str_err_code := 'CE000';
        ELSE
            str_err_code = int2err_code(err_code);
            err_msg = '[' || str_err_code || '] ' || err_msg;
        END IF;

        IF err_hint IS NOT NULL THEN
            RAISE EXCEPTION USING
                ERRCODE = str_err_code,
                MESSAGE = err_msg,
                HINT = err_hint;
        ELSE
            RAISE EXCEPTION USING
                ERRCODE = str_err_code,
                MESSAGE = err_msg,
                HINT = '';
        END IF;
    END;
$$ LANGUAGE plpgsql;

/******************************************************************************
 * TYPE: function - utility
 * NAME: raise_custom_error
 *
 * DESC: retrieve error message from custom_error_messages table and raise
 *       exception with the retrieved error message and hint
 *       (if error code is not found, raise exception with a generic message)
 *****************************************************************************/

CREATE OR REPLACE PROCEDURE raise_custom_error(ext_err_code smallint)
    LANGUAGE plpgsql
    AS $$
DECLARE
    var_err_msg   TEXT;
    var_err_hint  TEXT;
BEGIN
    -- Find error message in the custom_error_messages table 
    SELECT error_message, error_hint
    INTO var_err_msg, var_err_hint
    FROM tb_custom_errors
    WHERE error_code = ext_err_code;

    perform handle_custom_error(ext_err_code,var_err_name, var_err_hint);

END;
$$;


/******************************************************************************
 * TYPE: function - utility
 * NAME: raise_custom_error
 *
 * DESC: overloaded version for raising custom error by name
 *****************************************************************************/
CREATE OR REPLACE PROCEDURE raise_custom_error(ext_err_name dm_err_name)
    LANGUAGE plpgsql
    AS $$
DECLARE
    var_err_msg   TEXT;
    var_err_hint  TEXT;
    var_err_code  smallint;
BEGIN

    SELECT error_code, error_message, error_hint
    INTO var_err_code, var_err_msg, var_err_hint
    FROM tb_custom_errors
    WHERE error_name = ext_err_name;

    call handle_custom_error(var_err_code, var_err_msg, var_err_hint);

END;
$$;

/******************************************************************************
 * TYPE: schema related table population

 * DESC: populate the custom error messages table with some default error codes
 *****************************************************************************/
INSERT INTO tb_custom_errors (error_name, error_message, error_hint)
VALUES
    ('bss_hierarchy_violation',
        'Business role hierarchy violation',
        'Subordinate roles must be lower in hierarchy than superior roles'),
    ('bss_multiple_root_violation',
        'Multiple business user with root role in agency',
        'Only one business user can have the root role in an agency'),
    ('bss_agency_violation',
        'Business user agency violation',
        'Business user must belong to the same agency of his superior'),
    ('rental_info_only_if_rental',
        'Rental information are only allowed for rental properties',
        null);
