/******************************************************************************
 * TYPE: function - trigger
 * NAME: tf_infrastructure_tables_lock
 *
 * DESC: lock trigger function for infrastructure tables to prevent
 *       DML operations
 *****************************************************************************/
CREATE OR REPLACE FUNCTION tf_infrastructure_tables_lock()
    RETURNS TRIGGER
    LANGUAGE plpgsql
AS $$
    BEGIN
        RAISE prohibited_sql_statement_attempted USING
            MESSAGE = 'Prohibited SQL statement attempted',
            HINT = 'Only SELECT operations are allowed on infrastructure tables'
            ;
    END;
$$;
-------------------------------------------------------------------------------