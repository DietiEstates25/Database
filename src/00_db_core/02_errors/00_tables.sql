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

