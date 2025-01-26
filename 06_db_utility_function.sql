/******************************************************************************
 * TYPE: function - utility
 * NAME: raise_custom_error
 *
 * DESC: retrieve error message from custom_error_messages table and raise
 *       exception with the retrieved error message and hint
 *       (if error code is not found, raise exception with a generic message)
 *****************************************************************************/
CREATE FUNCTION raise_custom_error(ext_err_code text) RETURNS void
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

    -- Construct the error message and hint
    IF var_err_msg IS NULL THEN
        var_err_msg := '(CE000) An unknown error occurred';
        ext_err_code := 'CE000';
    ELSE
        var_err_msg := '(' || ext_err_code || ') ' || var_err_msg;
    END IF;

    IF var_err_hint IS NOT NULL THEN
        RAISE EXCEPTION USING
            ERRCODE = ext_err_code,
            MESSAGE = var_err_msg,
            HINT = var_err_hint;
    ELSE
        RAISE EXCEPTION USING
            ERRCODE = ext_err_code,
            MESSAGE = var_err_msg;
    END IF;

END;
$$;