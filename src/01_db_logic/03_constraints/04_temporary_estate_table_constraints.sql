/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_estate_fk_bss_usr
 *
 * DESC: foreign key constraint associating each estate with the businesses 
 *       user that created it
 *****************************************************************************/
ALTER TABLE tb_tmp_estate
    ADD CONSTRAINT tmp_estate_fk_bss_usr
        FOREIGN KEY (id_bss_usr)
        REFERENCES tb_bss_usr(id_usr)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_estate_fk_estete_type
 *
 * DESC: foreign key constraint associating each estate with it's type
*****************************************************************************/
ALTER TABLE tb_tmp_estate
    ADD CONSTRAINT tmp_estate_fk_estate_type
        FOREIGN KEY (id_estate_type)
        REFERENCES tb_estate_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_estate_fk_address
 *
 * DESC: foreign key constraint associating each estate with it's address
 *****************************************************************************/
ALTER TABLE tb_tmp_estate
    ADD CONSTRAINT tmp_estate_fk_address
        FOREIGN KEY (id_address)
        REFERENCES tb_address(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_estate_fk_ads_type
 *
 * DESC: foreign key constraint associating each estate with the type of ads 
 *       selling it
*****************************************************************************/
ALTER TABLE tb_tmp_estate
    ADD CONSTRAINT tmp_estate_fk_ads_type
        FOREIGN KEY (id_ads_type)
        REFERENCES tb_ads_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_name_table_fk_tmp_estate
 *
 * DESC: create foreign keys for temporary estate feature table to
 *       temporary estate table
 *****************************************************************************/
LANGUAGE plpgsql
DO $$
    DECLARE
        feature_estate_tables text[] := ARRAY[
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
        FOREACH table_name IN ARRAY feature_estate_tables LOOP
            EXECUTE format('
                ALTER TABLE tb_tmp_%1$s
                    ADD CONSTRAINT tmp_%1$s_fk_tmp_estate
                        FOREIGN KEY (id_estate)
                        REFERENCES tb_tmp_estate(id_estate)
                        ON DELETE cascade
                        ON UPDATE cascade,
                table_name
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
