/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: usr_data_fk_email
 *
 * DESC: foreign key constraint associating each user data with an email
 *****************************************************************************/
ALTER TABLE tb_usr_data
    ADD CONSTRAINT usr_data_fk_email
        FOREIGN KEY (id_email)
        REFRENCES tb_email(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: phone_fk_email
 *
 * DESC: foreign key constraint associating each phone number with an email
 *****************************************************************************/
ALTER TABLE tb_phone
    ADD CONSTRAINT phone_fk_email
        FOREIGN KEY (id_email)
        REFRENCES tb_email(id)
        ON DELETE cascade
        ON UPDATE cascade;
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
        REFRENCES tb_address(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: bss_usr_fk_email
 *
 * DESC: foreign key constraint associating each businesses user their email
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT bss_usr_fk_email
        FOREIGN KEY (id_email)
        REFRENCES tb_email(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: bss_usr_fk_role
 *
 * DESC: foreign key constraint associating each businesses user their role
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT bss_usr_fk_role
        FOREIGN KEY (id_role)
        REFRENCES tb_bss_role(hierarchy)
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
        REFRENCES tb_bss_usr(id_email)
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
        REFRENCES tb_agency(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_bss_usr_fk_email
 *
 * DESC: foreign key constraint associating each temporary businesses user with 
 *       their email
 *****************************************************************************/
ALTER TABLE tb_tmp_bss_usr
    ADD CONSTRAINT tmp_bss_usr_fk_email
        FOREIGN KEY (id_email)
        REFRENCES tb_email(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------
  -- TODO: here we need a trigger to check if the email is already in tb_bss_usr


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_bss_usr_fk_role
 *
 * DESC: foreign key constraint associating each temporary businesses user with 
 *       their role
 *****************************************************************************/
ALTER TABLE tb_tmp_bss_usr
    ADD CONSTRAINT tmp_bss_usr_fk_role
        FOREIGN KEY (id_role)
        REFRENCES tb_bss_role(hierarchy)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_bss_usr_fk_bss_usr
 *
 * DESC: foreign key constraint associating each temporary businesses user with 
 *       their superior
 *****************************************************************************/
ALTER TABLE tb_tmp_bss_usr
    ADD CONSTRAINT tmp_bss_usr_fk_bss_usr
        FOREIGN KEY (id_super)
        REFRENCES tb_bss_usr(id_email)
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
        REFRENCES tb_agency(id)
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
        REFRENCES tb_bss_usr(id_email)
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
        REFRENCES tb_estate_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: estaet_fk_address
 *
 * DESC: foreign key constraint associating each estate with it's address
 *****************************************************************************/
ALTER TABLE tb_estate
    ADD CONSTRAINT estate_fk_address
        FOREIGN KEY (id_address)
        REFRENCES tb_address(id)
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
        REFRENCES tb_ads_type(id)
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
        REFRENCES tb_bss_usr(id_email)
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
        REFRENCES tb_estate_type(id)
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
        REFRENCES tb_address(id)
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
        REFRENCES tb_ads_type(id)
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
        REFRENCES tb_estate(id)
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
        REFRENCES tb_tmp_estate(id)
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
 * DESC: check constraint to ensure temmporary number of parking spaces is 0 if
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
        REFRENCES tb_estate(id)
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
        REFRENCES tb_tmp_estate(id)
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
        REFRENCES tb_estate(id)
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
        FOREIGN KEY (id_type_furniture)
        REFRENCES tb_furniture_type(id)
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
        REFRENCES tb_tmp_estate(id)
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
        FOREIGN KEY (id_type_furniture)
        REFRENCES tb_furniture_type(id)
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
        REFRENCES tb_estate(id)
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
        REFRENCES tb_energy_class_type(id)
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
        REFRENCES tb_heating_type(id)
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
        REFRENCES tb_air_cond_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
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
        REFRENCES tb_tmp_estate(id)
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
        REFRENCES tb_energy_class_type(id)
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
        REFRENCES tb_heating_type(id)
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
        REFRENCES tb_air_cond_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
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
        REFRENCES tb_estate(id)
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
        FOREIGN KEY (id_type_property)
        REFRENCES tb_property_type(id)
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
        FOREIGN KEY (id_type_condition)
        REFRENCES tb_condition_type(id)
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
        REFRENCES tb_tmp_estate(id)
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
        FOREIGN KEY (id_type_property)
        REFRENCES tb_property_type(id)
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
        FOREIGN KEY (id_type_condition)
        REFRENCES tb_condition_type(id)
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
        REFRENCES tb_estate(id)
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
        REFRENCES tb_tmp_estate(id)
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
        REFRENCES tb_estate(id)
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
        REFRENCES tb_tmp_estate(id)
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
        REFRENCES tb_estate(id)
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
        REFRENCES tb_rental_contract_type(id)
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
        REFRENCES tb_rental_utilities_type(id)
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
        REFRENCES tb_tmp_estate(id)
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
        REFRENCES tb_rental_contract_type(id)
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
        REFRENCES tb_rental_utilities_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - primary key
 * NAME: pk_email_views
 *
 * DESC: primary key constraint for the views stats associated with the email
 *****************************************************************************/
ALTER TABLE tb_email_views
    ADD CONSTRAINT pk_email_views
        PRIMARY KEY (id_email, id_estate);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: email_views_fk_email
 *
 * DESC: foreign key constraint associating the views stats with the email
 *****************************************************************************/
ALTER TABLE tb_email_views
    ADD CONSTRAINT email_views_fk_email
        FOREIGN KEY (id_email)
        REFRENCES tb_email(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: email_views_fk_estate
 *
 * DESC: foreign key constraint associating the views stats, associated with 
 *       the email, with the estate
 *****************************************************************************/
ALTER TABLE tb_email_views
    ADD CONSTRAINT email_views_fk_estate
        FOREIGN KEY (id_estate)
        REFRENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - primary key
 * NAME: pk_email_booking
 *
 * DESC: primary key constraint for the booking stats associated with the email
 *****************************************************************************/
ALTER TABLE tb_email_booking
    ADD CONSTRAINT pk_email_booking
        PRIMARY KEY (id_email, id_estate);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: email_booking_fk_email
 *
 * DESC: foreign key constraint associating the booking stats with the email
 *****************************************************************************/
ALTER TABLE tb_email_booking
    ADD CONSTRAINT email_booking_fk_email
        FOREIGN KEY (id_email)
        REFRENCES tb_email(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: email_booking_fk_estate
 *
 * DESC: foreign key constraint associating the booking stats, associated with 
 *       the email, with the estate
 *****************************************************************************/
ALTER TABLE tb_email_booking  
    ADD CONSTRAINT email_booking_fk_estate
        FOREIGN KEY (id_estate)
        REFRENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - primary key
 * NAME: pk_email_offer
 *
 * DESC: primary key constraint for the offer stats associated with the email
 *****************************************************************************/
ALTER TABLE tb_email_offer
    ADD CONSTRAINT pk_email_offer
        PRIMARY KEY (id_email, id_estate);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: email_offer_fk_email
 *
 * DESC: foreign key constraint associating the offer stats with the email
 *****************************************************************************/
ALTER TABLE tb_email_offer
    ADD CONSTRAINT email_offer_fk_email
        FOREIGN KEY (id_email)
        REFRENCES tb_email(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: email_offer_fk_estate
 *
 * DESC: foreign key constraint associating the offer stats, associated with 
 *       the email, with the estate
 *****************************************************************************/
ALTER TABLE tb_email_offer
    ADD CONSTRAINT email_offer_fk_estate
        FOREIGN KEY (id_estate)
        REFRENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: estate_statistic_fk_estate
 *
 * DESC: foreign key constraint associating the aggregated estate statistics
 *       with the estate
 *****************************************************************************/
ALTER TABLE estate_statistic
    ADD CONSTRAINT estate_statistic_fk_estate
        FOREIGN KEY (id_estate)
        REFRENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------
