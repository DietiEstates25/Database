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
        type_tables text[] := ARRAY[
            'tb_usr_type',
            'tb_ads_type',
            'tb_estate_type',
            'tb_furniture_type',
            'tb_energy_class_type',
            'tb_heating_type',
            'tb_air_cond_type',
            'tb_property_type',
            'tb_condition_type',
            'tb_rental_contract_type',
            'tb_rental_utilities_type',
            'tb_action_type'
        ];

        table_name  text;

    BEGIN
        FOREACH table_name IN ARRAY type_tables LOOP
            EXECUTE format(
               'CREATE TRIGGER tg_%1$s_lock '
                   'BEFORE INSERT OR UPDATE OR DELETE '
                    'ON %1$I '
                    'FOR EACH STATEMENT '
                    'EXECUTE FUNCTION tf_lock_table()',
                table_name
            );    
        END LOOP; 
    END;
$$;
-------------------------------------------------------------------------------
