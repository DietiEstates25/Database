/******************************************************************************
 * TYPE: trigger
 * NAME: tg_custom_errors_lock
 *
 * DESC: trigger to block any action but select on the custom_errors table
 *****************************************************************************/
CREATE TRIGGER tg_custom_errors_lock
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_custom_errors
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_lock_table();
-------------------------------------------------------------------------------
