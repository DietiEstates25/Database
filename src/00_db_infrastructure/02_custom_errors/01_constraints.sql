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
-------------------------------------------------------------------------------