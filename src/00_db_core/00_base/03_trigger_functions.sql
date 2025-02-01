/******************************************************************************
 * TYPE: function - trigger
 * NAME: tf_lock_table
 *
 * DESC: lock trigger function for tables to prevent DML operations
 *****************************************************************************/
CREATE OR REPLACE FUNCTION tf_lock_table()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
    BEGIN
        RAISE prohibited_sql_statement_attempted USING
            MESSAGE = 'Prohibited SQL statement attempted',
            HINT = 'Only SELECT operations allowed on table';
    END;
$$;
-------------------------------------------------------------------------------
