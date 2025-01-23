TODO: to check everything considering also the new tables. To add new ones.

ALTER TABLE tb_usr_data
  ADD CONSTRAINT usr_data_fk_email
  FOREIGN KEY (id_email) REFERENCES tb_email(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_phone
  ADD CONSTRAINT phone_fk_email
  FOREIGN KEY (id_email) REFERENCES tb_email(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_bss_usr
  ADD CONSTRAINT bss_usr_fk_email
  FOREIGN KEY (id_email) REFERENCES tb_email(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_bss_usr
  ADD CONSTRAINT bss_usr_fk_role
  FOREIGN KEY (id_role) REFERENCES tb_bss_role(hierarchy)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_bss_usr
  ADD CONSTRAINT bss_usr_fk_bss_usr
  FOREIGN KEY (id_super) REFERENCES tb_bss_usr(id_email)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_bss_usr
  ADD CONSTRAINT bss_usr_fk_agency
  FOREIGN KEY (id_agency) REFERENCES tb_agency(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_estate
  ADD CONSTRAINT estate_fk_bss_usr
  FOREIGN KEY (id_bss_usr) REFERENCES tb_bss_usr(id_email)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_estate
  ADD CONSTRAINT estate_fk_estate_type
  FOREIGN KEY (id_estate_type) REFERENCES tb_estate_type(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_estate
  ADD CONSTRAINT estate_fk_ads_type
  FOREIGN KEY (id_ads_type) REFERENCES tb_ads_type(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_feature_sz
  ADD CONSTRAINT feature_sz_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_feature_sz
  ADD CONSTRAINT ck_main_area_plus
  CHECK (
    main_area > 0
  );

ALTER TABLE tb_feature_sz
  ADD CONSTRAINT ck_n_park_garage_area -- TODO change this name
  CHECK (
    garage_area <> 0 OR (n_indoor_park = 0 AND n_outdoor_park = 0) 
  );

ALTER TABLE tb_feature_floor
  ADD CONSTRAINT feature_floor_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_feature_floor
  ADD CONSTRAINT ck_total_floor_less_estate_floor
  CHECK (
    total_floor >= estate_floor
  );

ALTER TABLE tb_feature_comp
  ADD CONSTRAINT feature_comp_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_feature_comp
  ADD CONSTRAINT feature_comp_fk_furniture_type
  FOREIGN KEY (id_type_furniture) REFERENCES tb_furniture_type(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_feature_comp
  ADD CONSTRAINT ck_liveable_kitchen_only_if_kitchens
  CHECK (
    kitchens > 0 OR NOT liveable_kitchen
  );

ALTER TABLE tb_feature_energy_eff
  ADD CONSTRAINT feature_energy_eff_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_feature_energy_eff
  ADD CONSTRAINT feature_energy_eff_fk_energy_class_type
  FOREIGN KEY (id_energy_class_type) REFERENCES tb_energy_class_type(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_feature_energy_eff
  ADD CONSTRAINT feature_energy_eff_fk_heating_type
  FOREIGN KEY (id_heating_type) REFERENCES tb_heating_type(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_feature_energy_eff
  ADD CONSTRAINT feature_energy_eff_fk_air_cond_type
  FOREIGN KEY (id_air_cond_type) REFERENCES tb_air_cond_type(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_feature_condition
  ADD CONSTRAINT feature_condition_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_feature_condition
  ADD CONSTRAINT feature_condition_fk_property_type
  FOREIGN KEY (id_type_property) REFERENCES tb_property_type(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_feature_condition
  ADD CONSTRAINT feature_condition_fk_condition_type
  FOREIGN KEY (id_type_condition) REFERENCES tb_condition_type(id)
  ON DELETE cascade
  ON UPDATE cascade;


ALTER TABLE tb_feature_other
  ADD CONSTRAINT feature_other_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_price
  ADD CONSTRAINT price_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_price
  ADD CONSTRAINT ck_price_plus
  CHECK (
    price > 0
  );

ALTER TABLE tb_rental_info
  ADD CONSTRAINT rental_info_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_rental_info
  ADD CONSTRAINT rental_info_fk_rental_contract_type
  FOREIGN KEY (id_rental_contract_type) REFERENCES tb_rental_contract_type(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_rental_info
  ADD CONSTRAINT rental_info_fk_rental_utilities_type
  FOREIGN KEY (id_rental_utilities_type) REFERENCES tb_rental_utilities_type(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_email_views
  ADD CONSTRAINT email_views_pk PRIMARY KEY (id_email, id_estate);

ALTER TABLE tb_email_views
  ADD CONSTRAINT email_views_fk_email
  FOREIGN KEY (id_email) REFERENCES tb_email(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_email_views
  ADD CONSTRAINT email_views_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_email_booking
  ADD CONSTRAINT email_booking_pk PRIMARY KEY (id_email, id_estate);

ALTER TABLE tb_email_booking
  ADD CONSTRAINT email_booking_fk_email
  FOREIGN KEY (id_email) REFERENCES tb_email(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_email_booking  
  ADD CONSTRAINT email_booking_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_email_offer
  ADD CONSTRAINT email_offer_pk PRIMARY KEY (id_email, id_estate);

ALTER TABLE tb_email_offer
  ADD CONSTRAINT email_offer_fk_email
  FOREIGN KEY (id_email) REFERENCES tb_email(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE tb_email_offer
  ADD CONSTRAINT email_offer_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;

ALTER TABLE estate_statistic
  ADD CONSTRAINT estate_statistic_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;
