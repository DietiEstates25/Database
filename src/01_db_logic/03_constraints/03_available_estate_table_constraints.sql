/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: available_estate_fk_estate
 *
 * DESC: foreign key constraint associating an available estate to an estate
 *****************************************************************************/
ALTER TABLE tb_available_estate
    ADD CONSTRAINT available_estate_fk_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: available_estate_fk_bss_usr
 *
 * DESC: foreign key constraint associating each estate with the businesses 
 *       user that created it
 *****************************************************************************/
ALTER TABLE tb_available_estate
    ADD CONSTRAINT available_estate_fk_bss_usr
        FOREIGN KEY (id_bss_usr)
        REFERENCES tb_bss_usr(id_usr)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: available_estate_fk_estete_type
 *
 * DESC: foreign key constraint associating each estate with it's type
*****************************************************************************/
ALTER TABLE tb_available_estate
    ADD CONSTRAINT available_estate_fk_estate_type
        FOREIGN KEY (id_estate_type)
        REFERENCES tb_estate_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: available_estate_fk_address
 *
 * DESC: foreign key constraint associating each estate with it's address
 *****************************************************************************/
ALTER TABLE tb_available_estate
    ADD CONSTRAINT available_estate_fk_address
        FOREIGN KEY (id_address)
        REFERENCES tb_address(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: available_estate_fk_ads_type
 *
 * DESC: foreign key constraint associating each estate with the type of ads 
 *       selling it
*****************************************************************************/
ALTER TABLE tb_available_estate
    ADD CONSTRAINT available_estate_fk_ads_type
        FOREIGN KEY (id_ads_type)
        REFERENCES tb_ads_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: available_name_table_fk_available_estate
 *
 * DESC: create foreign keys for available estate feature table to
 *       available estate table
 *****************************************************************************/
DO
LANGUAGE plpgsql
$$
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
            EXECUTE format(
                'ALTER TABLE tb_available_%1$s '
                    'ADD CONSTRAINT available_%1$s_fk_available_estate '
                        'FOREIGN KEY (id_estate) '
                        'REFERENCES tb_available_estate(id_estate) '
                        'ON DELETE cascade '
                        'ON UPDATE cascade',
                table_name
            );    
        END LOOP; 
    END;
$$;
-------------------------------------------------------------------------------
