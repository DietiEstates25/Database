/******************************************************************************
 * TYPE: function - utility
 * NAME: int2err_code
 *
 * DESC: given an integer err_code return a well formatted string 
 *       error code with that integer
 *****************************************************************************/
CREATE OR REPLACE FUNCTION int2err_code(
    num_err_code    smallint
)
RETURNS varchar(5)
LANGUAGE plpgsql
AS $$
    BEGIN
        RETURN 'CE' || to_char(num_err_code, '999');
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: function - utility
 * NAME: handle_custom_error
 *
 * DESC: given custom error details raise an exception accordingly
 *****************************************************************************/
CREATE OR REPLACE FUNCTION handle_custom_error(
    err_code    smallint,
    err_msg     text,
    err_hint    text
)
RETURNS void
LANGUAGE plpgsql
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
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: function - utility
 * NAME: raise_custom_error
 *
 * DESC: retrieve error message from custom_error_messages table and raise
 *       exception with the retrieved error message and hint
 *       (if error code is not found, raise exception with a generic message)
 *****************************************************************************/
CREATE OR REPLACE FUNCTION raise_custom_error(
    ext_err_code    smallint
)
RETURNS void
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

        PERFORM handle_custom_error(ext_err_code,var_err_name, var_err_hint);

    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: function - utility
 * NAME: raise_custom_error
 *
 * DESC: overloaded version for raising custom error by name
 *****************************************************************************/
CREATE OR REPLACE FUNCTION raise_custom_error(
    ext_err_name    dm_usalnum
)
RETURNS void
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

        SELECT handle_custom_error(var_err_code, var_err_msg, var_err_hint);

    END;
$$;
-------------------------------------------------------------------------------
