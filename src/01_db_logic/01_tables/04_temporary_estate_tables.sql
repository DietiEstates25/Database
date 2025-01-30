/******************************************************************************
 * TYPE: tables
 * NAME: tb_tmp_name_table
 *
 * DESC: create temporary tables related to estate tables
 *****************************************************************************/
LANGUAGE plpgsql
DO $$
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
                'CREATE TABLE tb_tmp_%1$s ('
                    'LIKE tb_available_%1$s INCLUDING ALL'
                ')',
                table_name
            );    
        END LOOP; 
    END;
$$;
-------------------------------------------------------------------------------
