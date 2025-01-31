/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [available/not_available/tmp]_name_table_fk_estate
 *
 * DESC: create foreign keys for estate feature tables to estate table
 *****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        feature_estate_tables   text[];
        table_name              text;
        prefix_array    text[] := ARRAY['available', 'not_available', 'tmp'];
        prefix          text;

    BEGIN
        feature_estate_tables := fn_get_feature_estate_tables();

        FOREACH table_name IN ARRAY feature_estate_tables LOOP
            FOREACH prefix IN ARRAY prefix_array LOOP
                EXECUTE format(
                    'ALTER TABLE tb_%1$s_%2$s '
                        'ADD CONSTRAINT %1$s_%2$s_fk_estate '
                            'FOREIGN KEY (id_estate) '
                            'REFERENCES tb_estate(id) '
                            'ON DELETE cascade '
                            'ON UPDATE cascade',
                    prefix,
                    table_name
                );    
            END LOOP; 
        END LOOP; 

    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [available/not_available/tmp]_ads_type_fk_ads_type
 *
 * DESC: foreign key constraint associating each estate with the type of ads 
 *       selling it
*****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['available', 'not_available', 'tmp'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_ads_type '
                    'ADD CONSTRAINT %1$s_ads_type_fk_ads_type '
                        'FOREIGN KEY (id_ads_type) '
                        'REFERENCES tb_ads_type(id) '
                        'ON DELETE cascade '
                        'ON UPDATE cascade',
                prefix
            );
        END LOOP;
        
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [available/not_available/tmp]_estate_type_fk_estate_type
 *
 * DESC: foreign key constraint associating each estate with the type of estate 
*****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['available', 'not_available', 'tmp'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_estate_type '
                    'ADD CONSTRAINT %1$s_estate_type_fk_estate_type '
                        'FOREIGN KEY (id_estate_type) '
                        'REFERENCES tb_estate_type(id) '
                        'ON DELETE cascade '
                        'ON UPDATE cascade',
                prefix
            );
        END LOOP;
        
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [available/not_available/tmp]_feature_comp_fk_furniture_type
 *
 * DESC: foreign key constraint associating each estate
 *       with the type of furniture
*****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['available', 'not_available', 'tmp'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_feature_comp '
                    'ADD CONSTRAINT %1$s_feature_comp_fk_furniture_type '
                        'FOREIGN KEY (id_furniture_type) '
                        'REFERENCES tb_furniture_type(id) '
                        'ON DELETE cascade '
                        'ON UPDATE cascade',
                prefix
            );
        END LOOP;
        
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [available/not_available/tmp]_feature_energy_eff_fk_energy_class_type
 *
 * DESC: foreign key constraint associating each estate
 *       with the type of energy class
*****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['available', 'not_available', 'tmp'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_feature_energy_eff '
                    'ADD CONSTRAINT %1$s_feature_energy_eff_fk_energy_class_type '
                        'FOREIGN KEY (id_energy_class_type) '
                        'REFERENCES tb_energy_class_type(id) '
                        'ON DELETE cascade '
                        'ON UPDATE cascade',
                prefix
            );
        END LOOP;
        
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [available/not_available/tmp]_feature_energy_eff_fk_heating_type
 *
 * DESC: foreign key constraint associating each estate
 *       with the type of heating
*****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['available', 'not_available', 'tmp'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_feature_energy_eff '
                    'ADD CONSTRAINT %1$s_feature_energy_eff_fk_heating_type '
                        'FOREIGN KEY (id_heating_type) '
                        'REFERENCES tb_heating_type(id) '
                        'ON DELETE cascade '
                        'ON UPDATE cascade',
                prefix
            );
        END LOOP;
        
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [available/not_available/tmp]_feature_energy_eff_fk_air_cond_type
 *
 * DESC: foreign key constraint associating each estate
 *       with the type of air conditioning
*****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['available', 'not_available', 'tmp'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_feature_energy_eff '
                    'ADD CONSTRAINT %1$s_feature_energy_eff_fk_air_cond_type '
                        'FOREIGN KEY (id_air_cond_type) '
                        'REFERENCES tb_air_cond_type(id) '
                        'ON DELETE cascade '
                        'ON UPDATE cascade',
                prefix
            );
        END LOOP;
        
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [available/not_available/tmp]_feature_condition_fk_property_type
 *
 * DESC: foreign key constraint associating each estate
 *       with the type of property
*****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['available', 'not_available', 'tmp'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_feature_condition '
                    'ADD CONSTRAINT %1$s_feature_condition_fk_property_type '
                        'FOREIGN KEY (id_property_type) '
                        'REFERENCES tb_property_type(id) '
                        'ON DELETE cascade '
                        'ON UPDATE cascade',
                prefix
            );
        END LOOP;
        
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [available/not_available/tmp]_feature_condition_fk_condition_type
 *
 * DESC: foreign key constraint associating each estate
 *       with the type of condition
*****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['available', 'not_available', 'tmp'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_feature_condition '
                    'ADD CONSTRAINT %1$s_feature_condition_fk_condition_type '
                        'FOREIGN KEY (id_condition_type) '
                        'REFERENCES tb_condition_type(id) '
                        'ON DELETE cascade '
                        'ON UPDATE cascade',
                prefix
            );
        END LOOP;
        
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [available/not_available/tmp]_rental_info_fk_rental_contract_type
 *
 * DESC: foreign key constraint associating each estate
 *       with the type of rental contract
*****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['available', 'not_available', 'tmp'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_rental_info '
                    'ADD CONSTRAINT %1$s_rental_info_fk_rental_contract_type '
                        'FOREIGN KEY (id_rental_contract_type) '
                        'REFERENCES tb_rental_contract_type(id) '
                        'ON DELETE cascade '
                        'ON UPDATE cascade',
                prefix
            );
        END LOOP;
        
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [available/not_available/tmp]_rental_info_fk_rental_utilities_type
 *
 * DESC: foreign key constraint associating each estate
 *       with the type of rental utilities
*****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['available', 'not_available', 'tmp'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_rental_info '
                    'ADD CONSTRAINT %1$s_rental_info_fk_rental_utilities_type '
                        'FOREIGN KEY (id_rental_utilities_type) '
                        'REFERENCES tb_rental_utilities_type(id) '
                        'ON DELETE cascade '
                        'ON UPDATE cascade',
                prefix
            );
        END LOOP;
        
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - check
 * NAME: ck_tmp_main_area_plus
 *
 * DESC: check constraint for temporary main area to be positive
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_sz
    ADD CONSTRAINT ck_tmp_main_area_plus
        CHECK (
            main_area > 0
        );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - check
 * NAME: ck_tmp_garage_area_parking_spaces
 *
 * DESC: check constraint to ensure temporary number of parking spaces is 0 if
 *       garage area is 0
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_sz
    ADD CONSTRAINT ck_tmp_garage_area_parking_spaces
        CHECK (
            garage_area <> 0 OR (n_indoor_park = 0 AND n_outdoor_park = 0) 
        );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - check
 * NAME: ck_tmp_total_floor_less_estate_floor
 *
 * DESC: check constraint to ensure temporary number of total floor of the
 *       building is greater or equal to the temporary floor the estate is on
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_floor
    ADD CONSTRAINT ck_tmp_total_floor_less_estate_floor
        CHECK (
            total_floor >= estate_floor
        );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - check
 * NAME: ck_tmp_liveable_kitchen_only_if_kitchens
 *
 * DESC: check constraint to ensure that the kitchen is liveable only if there
 *       are kitchens in the temporary composition features
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_comp
    ADD CONSTRAINT ck_tmp_liveable_kitchen_only_if_kitchens
        CHECK (
            kitchens > 0 OR NOT liveable_kitchen
        );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - check
 * NAME: ck_tmp_EPGL_plus
 *
 * DESC: check constraint to ensure that EPGL is a positive integer
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_energy_eff
    ADD CONSTRAINT ck_tmp_EPGL_plus
        CHECK (
            epgl > 0
        );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - check
 * NAME: ck_tmp_price_plus
 *
 * DESC: check constraint for temporary price to be positive
 *****************************************************************************/
ALTER TABLE tb_tmp_price
    ADD CONSTRAINT ck_tmp_price_plus
        CHECK (
            price > 0
        );
-------------------------------------------------------------------------------
