/******************************************************************************
 * TYPE: tables
 * NAME: tmp_not_available_name_table
 *
 * DESC: create not available tables related to estate tables
 *****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        estate_tables text[] := ARRAY[
            'estate',
            'feature_sz',
            'feature_floor',
            'feature_comp',
            'feature_energy_eff',
            'feature_condition',
            'feature_other',
            'price',
            'rental_info'
        ];

        table_name  text;

    BEGIN
        FOREACH table_name IN ARRAY estate_tables LOOP
            EXECUTE format(
                'CREATE TABLE tb_not_available_%1$s ('
                    'LIKE tb_available_%1$s INCLUDING ALL'
                ')',
                table_name
            );    
        END LOOP; 
    END;
$$;
-------------------------------------------------------------------------------
