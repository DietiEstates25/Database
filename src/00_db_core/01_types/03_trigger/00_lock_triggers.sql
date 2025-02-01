/******************************************************************************
 * TYPE: trigger 
 * NAME: tg_name_table_lock
 *
 * DESC: triggers for locking all type tables
 *****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        type_tables text[];
        table_name  text;

    BEGIN
        type_tables := fn_get_type_tables();

        FOREACH table_name IN ARRAY type_tables LOOP
            EXECUTE format(
               'CREATE TRIGGER tg_%1$s_type_lock '
                   'BEFORE INSERT OR UPDATE OR DELETE '
                    'ON tb_%1$s_type '
                    'FOR EACH STATEMENT '
                    'EXECUTE FUNCTION tf_lock_table()',
                table_name
            );    
        END LOOP; 
    END;
$$;
-------------------------------------------------------------------------------
