/******************************************************************************
 * TYPE: constraint - unique
 * NAME: uq_id_is_bss
 *
 * DESC: unique constraint associating an id for an user type and information
 *       if it is a business type or not 
 *****************************************************************************/
ALTER TABLE tb_usr_type
    ADD CONSTRAINT uq_id_is_bss
        UNIQUE (id, is_bss);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: usr_fk_usr_type
 *
 * DESC: foreign key constraint associating an user with an user type
 *****************************************************************************/
ALTER TABLE tb_usr
    ADD CONSTRAINT usr_fk_usr_type
        FOREIGN KEY (id_usr_type, is_bss)
        REFERENCES tb_usr_type(id, is_bss)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: usr_data_fk_usr
 *
 * DESC: foreign key constraint associating each user data with an user
 *****************************************************************************/
ALTER TABLE tb_usr_data
    ADD CONSTRAINT usr_data_fk_usr
        FOREIGN KEY (id_usr)
        REFERENCES tb_usr(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: phone_fk_usr
 *
 * DESC: foreign key constraint associating each phone number with an user
 *****************************************************************************/
ALTER TABLE tb_phone
    ADD CONSTRAINT phone_fk_usr
        FOREIGN KEY (id_usr)
        REFERENCES tb_usr(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - unique
 * NAME: unique_coordinates

 * DESC: unique constraint for the coordinates
 *****************************************************************************/
ALTER TABLE tb_address
    ADD CONSTRAINT unique_coordinates
        UNIQUE (latitude, longitude);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: agency_fk_address
 *
 * DESC: foreign key constraint associating each agency with it's address
 *****************************************************************************/
ALTER TABLE tb_agency
    ADD CONSTRAINT agency_fk_address
        FOREIGN KEY (id_address)
        REFERENCES tb_address(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: bss_usr_fk_usr
 *
 * DESC: foreign key constraint associating each businesses user their user
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT bss_usr_fk_usr
        FOREIGN KEY (id_usr)
        REFERENCES tb_usr(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: bss_usr_fk_super_bss_usr
 *
 * DESC: recursive foreign key constraint associating each businesses user with 
 *       their superior
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT bss_usr_fk_super_bss_usr
        FOREIGN KEY (id_super)
        REFERENCES tb_bss_usr(id_usr)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: bss_usr_fk_agency
 *
 * DESC: foreign key constraint for tb_bss_usr to tb_agency
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT bss_usr_fk_agency
        FOREIGN KEY (id_agency)
        REFERENCES tb_agency(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_bss_usr_fk_usr
 *
 * DESC: foreign key constraint associating each temporary businesses user with 
 *       their usr
 *****************************************************************************/
ALTER TABLE tb_tmp_bss_usr
    ADD CONSTRAINT tmp_bss_usr_fk_usr
        FOREIGN KEY (id_usr)
        REFERENCES tb_usr(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------
  -- TODO: here we need a trigger to check if the usr is already in tb_bss_usr


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_bss_usr_fk_super_bss_usr
 *
 * DESC: foreign key constraint associating each temporary businesses user with 
 *       their superior
 *****************************************************************************/
ALTER TABLE tb_tmp_bss_usr
    ADD CONSTRAINT tmp_bss_usr_fk_bss_usr
        FOREIGN KEY (id_super)
        REFERENCES tb_bss_usr(id_usr)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_bss_usr_fk_agency
 *
 * DESC: foreign key constraint associating each temporary businesses user with 
 *       their agency
 *****************************************************************************/
ALTER TABLE tb_tmp_bss_usr
    ADD CONSTRAINT tmp_bss_usr_fk_agency
        FOREIGN KEY (id_agency)
        REFERENCES tb_agency(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: estate_fk_bss_usr
 *
 * DESC: foreign key constraint associating each estate with the businesses 
 *       user that created it
 *****************************************************************************/
ALTER TABLE tb_estate
    ADD CONSTRAINT estate_fk_bss_usr
        FOREIGN KEY (id_bss_usr)
        REFERENCES tb_bss_usr(id_usr)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: estate_fk_estete_type
 *
 * DESC: foreign key constraint associating each estate with it's type
*****************************************************************************/
ALTER TABLE tb_estate
    ADD CONSTRAINT estate_fk_estate_type
        FOREIGN KEY (id_estate_type)
        REFERENCES tb_estate_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: estate_fk_address
 *
 * DESC: foreign key constraint associating each estate with it's address
 *****************************************************************************/
ALTER TABLE tb_estate
    ADD CONSTRAINT estate_fk_address
        FOREIGN KEY (id_address)
        REFERENCES tb_address(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: estate_fk_ads_type
 *
 * DESC: foreign key constraint associating each estate with the type of ads 
 *       selling it
*****************************************************************************/
ALTER TABLE tb_estate
    ADD CONSTRAINT estate_fk_ads_type
        FOREIGN KEY (id_ads_type)
        REFERENCES tb_ads_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_estate_fk_bss_usr
 *
 * DESC: foreign key constraint associating each temporary estate with the 
 *       businesses user that created it
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
 * NAME: tmp_estate_fk_estate_type
 *
 * DESC: foreign key constraint associating each temporary estate with it's 
 *       type
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
 * DESC: foreign key constraint associating each temporary estate with it's 
 *       address
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
 * DESC: foreign key constraint associating each temporary estate with the type 
 *       of ads selling it
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
 * NAME: feature_sz_fk_estate
 *
 * DESC: foreign key constraint associating the size features with the estate
 *****************************************************************************/
ALTER TABLE tb_feature_sz
    ADD CONSTRAINT feature_sz_fk_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - check
 * NAME: ck_main_area_plus
 *
 * DESC: check constraint for main area to be positive
 *****************************************************************************/
ALTER TABLE tb_feature_sz
    ADD CONSTRAINT ck_main_area_plus
        CHECK (
            main_area > 0
        );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - check
 * NAME: ck_garage_area_parking_spaces
 *
 * DESC: check constraint to ensure number of parking spaces is 0 if garage 
 *       area is 0
 *****************************************************************************/
ALTER TABLE tb_feature_sz
    ADD CONSTRAINT ck_garage_area_parking_spaces
        CHECK (
            garage_area <> 0 OR (n_indoor_park = 0 AND n_outdoor_park = 0) 
        );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_feature_sz_fk_tmp_estate
 *
 * DESC: foreign key constraint associating the temporary size features with
 *       it's estate
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_sz
    ADD CONSTRAINT tmp_feature_sz_fk_tmp_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_tmp_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
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
 * TYPE: constraint - foreign key
 * NAME: feature_floor_fk_estate
 *
 * DESC: foreign key constraint associating the floor features with the estate
 *****************************************************************************/
ALTER TABLE tb_feature_floor
    ADD CONSTRAINT feature_floor_fk_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint
 * NAME: ck_total_floor_less_estate_floor
 *
 * DESC: check constraint to ensure number of total floor of the building is
 *       greater or equal to the floor the estate is on
 *****************************************************************************/
ALTER TABLE tb_feature_floor
    ADD CONSTRAINT ck_total_floor_less_estate_floor
        CHECK (
            total_floor >= estate_floor
        );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_feature_floor_fk_tmp_estate
 *
 * DESC: foreign key constraint associating the temporary floor features with
 *       the estate
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_floor
    ADD CONSTRAINT tmp_feature_floor_fk_tmp_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_tmp_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
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
 * TYPE: constraint - foreign key
 * NAME: feature_comp_fk_estate
 *
 * DESC: foreign key constraint associating the composition features with the
 *       estate
 *****************************************************************************/
ALTER TABLE tb_feature_comp
    ADD CONSTRAINT feature_comp_fk_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: feature_comp_fk_furniture_type
 *
 * DESC: foreign key constraint associating the composition features with the
 *       furniture type
 *****************************************************************************/
ALTER TABLE tb_feature_comp
    ADD CONSTRAINT feature_comp_fk_furniture_type
        FOREIGN KEY (id_furniture_type)
        REFERENCES tb_furniture_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - check
 * NAME: ck_liveable_kitchen_only_if_kitchens
 *
 * DESC: check constraint to ensure that the kitchen is liveable only if there
 *       are kitchens
 *****************************************************************************/
ALTER TABLE tb_feature_comp
    ADD CONSTRAINT ck_liveable_kitchen_only_if_kitchens
        CHECK (
            kitchens > 0 OR NOT liveable_kitchen
        );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_feature_comp_fk_tmp_estate
 *
 * DESC: foreign key constraint associating the temporary composition features
 *       with the estate
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_comp
    ADD CONSTRAINT tmp_feature_comp_fk_tmp_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_tmp_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_feature_comp_fk_furniture_type
 *
 * DESC: foreign key constraint associating the temporary composition features
 *       with the furniture type
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_comp
    ADD CONSTRAINT tmp_feature_comp_fk_furniture_type
        FOREIGN KEY (id_furniture_type)
        REFERENCES tb_furniture_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
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
 * TYPE: constraint - foreign key
 * NAME: feature_energy_eff_fk_estate
 *
 * DESC: foreign key constraint associating the energy efficiency features with
 *       the estate
 *****************************************************************************/
ALTER TABLE tb_feature_energy_eff
    ADD CONSTRAINT feature_energy_eff_fk_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: feature_energy_eff_fk_energy_class_type
 *
 * DESC: foreign key constraint associating the energy efficiency features with
 *       the energy class type
 *****************************************************************************/
ALTER TABLE tb_feature_energy_eff
    ADD CONSTRAINT feature_energy_eff_fk_energy_class_type
        FOREIGN KEY (id_energy_class_type)
        REFERENCES tb_energy_class_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: feature_energy_eff_fk_heating_type
 *
 * DESC: foreign key constraint associating the energy efficiency features with
 *       the heating type
 *****************************************************************************/
ALTER TABLE tb_feature_energy_eff
    ADD CONSTRAINT feature_energy_eff_fk_heating_type
        FOREIGN KEY (id_heating_type)
        REFERENCES tb_heating_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: feature_energy_eff_fk_air_cond_type
 *
 * DESC: foreign key constraint associating the energy efficiency features with
 *       the air conditioning type
 *****************************************************************************/
ALTER TABLE tb_feature_energy_eff
    ADD CONSTRAINT feature_energy_eff_fk_air_cond_type
        FOREIGN KEY (id_air_cond_type)
        REFERENCES tb_air_cond_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - check
 * NAME: ck_EPGL_plus
 *
 * DESC: check constraint to ensure that EPGL is a positive integer
 *****************************************************************************/
ALTER TABLE tb_feature_energy_eff
    ADD CONSTRAINT ck_EPGL_plus
        CHECK (
            epgl > 0
        );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_feature_energy_eff_fk_tmp_estate
 *
 * DESC: foreign key constraint associating the temporary energy efficiency
 *       features with the estate
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_energy_eff
    ADD CONSTRAINT tmp_feature_energy_eff_fk_tmp_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_tmp_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_feature_energy_eff_fk_energy_class_type
 *
 * DESC: foreign key constraint associating the temporary energy efficiency
          features with the energy class type
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_energy_eff
    ADD CONSTRAINT tmp_feature_energy_eff_fk_energy_class_type
        FOREIGN KEY (id_energy_class_type)
        REFERENCES tb_energy_class_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_feature_energy_eff_fk_heating_type
 *
 * DESC: foreign key constraint associating the temporary energy efficiency
 *       features with the heating type
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_energy_eff
    ADD CONSTRAINT tmp_feature_energy_eff_fk_heating_type
        FOREIGN KEY (id_heating_type)
        REFERENCES tb_heating_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_feature_energy_eff_fk_air_cond_type
 *
 * DESC: foreign key constraint associating the temporary energy efficiency
 *       features with the air conditioning type
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_energy_eff
    ADD CONSTRAINT tmp_feature_energy_eff_fk_air_cond_type
        FOREIGN KEY (id_air_cond_type)
        REFERENCES tb_air_cond_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
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
 * TYPE: constraint - foreign key
 * NAME: feature_condition_fk_estate
 *
 * DESC: foreign key constraint associating the condition features with the
 *       estate
 *****************************************************************************/
ALTER TABLE tb_feature_condition
    ADD CONSTRAINT feature_condition_fk_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: feature_condition_fk_property_type
 *
 * DESC: foreign key constraint associating the condition features with the
 *       property type
 *****************************************************************************/
ALTER TABLE tb_feature_condition
    ADD CONSTRAINT feature_condition_fk_property_type
        FOREIGN KEY (id_property_type)
        REFERENCES tb_property_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: feature_condition_fk_condition_type
 *
 * DESC: foreign key constraint associating the condition features with the
 *       condition type
 *****************************************************************************/
ALTER TABLE tb_feature_condition
    ADD CONSTRAINT feature_condition_fk_condition_type
        FOREIGN KEY (id_condition_type)
        REFERENCES tb_condition_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_feature_condition_fk_tmp_estate
 *
 * DESC: foreign key constraint associating the temporary condition features
 *       with the estate
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_condition
    ADD CONSTRAINT tmp_feature_condition_fk_tmp_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_tmp_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_feature_condition_fk_property_type
 *
 * DESC: foreign key constraint associating the temporary condition features
 *       with the property type
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_condition
    ADD CONSTRAINT tmp_feature_condition_fk_property_type
        FOREIGN KEY (id_property_type)
        REFERENCES tb_property_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_feature_condition_fk_condition_type
 *
 * DESC: foreign key constraint associating the temporary condition features
 *       with the condition type
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_condition
    ADD CONSTRAINT tmp_feature_condition_fk_condition_type
        FOREIGN KEY (id_condition_type)
        REFERENCES tb_condition_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: feature_other_fk_estate
 *
 * DESC: foreign key constraint associating the other features with the estate
 *****************************************************************************/
ALTER TABLE tb_feature_other
    ADD CONSTRAINT feature_other_fk_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_feature_other_fk_tmp_estate
 *
 * DESC: foreign key constraint associating the temporary other features with
 *       the estate
 *****************************************************************************/
ALTER TABLE tb_tmp_feature_other
    ADD CONSTRAINT tmp_feature_other_fk_tmp_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_tmp_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: price_fk_estate
 *
 * DESC: foreign key constraint associating the price with the estate
 *****************************************************************************/
ALTER TABLE tb_price
    ADD CONSTRAINT price_fk_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - check
 * NAME: ck_price_plus
 *
 * DESC: check constraint for price to be positive
 *****************************************************************************/
ALTER TABLE tb_price
    ADD CONSTRAINT ck_price_plus
        CHECK (
            price > 0
        );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_price_fk_tmp_estate
 *
 * DESC: foreign key constraint associating the temporary price with the estate
 *****************************************************************************/
ALTER TABLE tb_tmp_price
    ADD CONSTRAINT tmp_price_fk_tmp_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_tmp_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
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


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: rental_info_fk_estate
 *
 * DESC: foreign key constraint associating the rental info with the estate
 *****************************************************************************/
ALTER TABLE tb_rental_info
    ADD CONSTRAINT rental_info_fk_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: rental_info_fk_rental_contract_type
 *
 * DESC: foreign key constraint associating the rental info with the rental 
 *       contract type
 *****************************************************************************/
ALTER TABLE tb_rental_info
    ADD CONSTRAINT rental_info_fk_rental_contract_type
        FOREIGN KEY (id_rental_contract_type)
        REFERENCES tb_rental_contract_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: rental_info_fk_rental_utilities_type
 *
 * DESC: foreign key constraint associating the rental info with the rental 
 *       utilities type
 *****************************************************************************/
ALTER TABLE tb_rental_info
    ADD CONSTRAINT rental_info_fk_rental_utilities_type
        FOREIGN KEY (id_rental_utilities_type)
        REFERENCES tb_rental_utilities_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_rental_info_fk_tmp_estate
 *
 * DESC: foreign key constraint associating the temporary rental info with the
 *       estate
 *****************************************************************************/
ALTER TABLE tb_tmp_rental_info
    ADD CONSTRAINT tmp_rental_info_fk_tmp_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_tmp_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_rental_info_fk_rental_contract_type
 *
 * DESC: foreign key constraint associating the temporary rental info with the
 *       rental contract type
 *****************************************************************************/
ALTER TABLE tb_tmp_rental_info
    ADD CONSTRAINT tmp_rental_info_fk_rental_contract_type
        FOREIGN KEY (id_rental_contract_type)
        REFERENCES tb_rental_contract_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_rental_info_fk_rental_utilities_type
 *
 * DESC: foreign key constraint associating the temporary rental info with the
 *       rental utilities type
 *****************************************************************************/
ALTER TABLE tb_tmp_rental_info
    ADD CONSTRAINT tmp_rental_info_fk_rental_utilities_type
        FOREIGN KEY (id_rental_utilities_type)
        REFERENCES tb_rental_utilities_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - primary key
 * NAME: pk_usr_action
 *
 * DESC: primary key constraint for the action stats associated with the usr
 *****************************************************************************/
ALTER TABLE tb_usr_action
    ADD CONSTRAINT pk_usr_action
        PRIMARY KEY (id_usr, id_estate);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: usr_action_fk_usr
 *
 * DESC: foreign key constraint associating the action stats with the user
 *****************************************************************************/
ALTER TABLE tb_usr_action
    ADD CONSTRAINT usr_action_fk_usr
        FOREIGN KEY (id_usr)
        REFERENCES tb_usr(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: usr_action_fk_estate
 *
 * DESC: foreign key constraint associating the action stats, associated with 
 *       the user, with the estate
 *****************************************************************************/
ALTER TABLE tb_usr_action
    ADD CONSTRAINT usr_action_fk_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: usr_action_fk_action
 *
 * DESC: foreign key constraint associating the action stats, associated with 
 *       the usr, with the action
 *****************************************************************************/
ALTER TABLE tb_usr_action
    ADD CONSTRAINT usr_action_fk_action
        FOREIGN KEY (id_estate)
        REFERENCES tb_action_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------
