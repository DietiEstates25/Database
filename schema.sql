CREATE TABLE tb_email (
  id    serial PRIMARY KEY,
  email dm_email UNIQUE NOT NULL
);

CREATE TABLE tb_usr_data (
  id_email  integer PRIMARY KEY,
  firs_name dm_smp_str NOT NULL,
  last_name dm_smp_str NOT NULL,
  dob       dm_dob NOT NULL,
  gender    ty_gender NOT NULL
);

ALTER TABLE tb_usr_data
  ADD CONSTRAINT usr_data_fk_email
  FOREIGN KEY (id_email) REFERENCES tb_email(id)
  ON DELETE cascade
  ON UPDATE cascade;

CREATE TABLE tb_phone (
  id_email  integer PRIMARY KEY,
  phone     dm_phone UNIQUE NOT NULL
);

ALTER TABLE tb_phone
  ADD CONSTRAINT phone_fk_email
  FOREIGN KEY (id_email) REFERENCES tb_email(id)
  ON DELETE cascade
  ON UPDATE cascade;

CREATE TABLE tb_bss_role (
  hierarchy dm_int0plus PRIMARY KEY,    -- bottom up
  role      dm_smp_str UNIQUE NOT NULL
);

CREATE TABLE tb_agency (
  id      serial PRIMARY KEY,
  name    dm_smp_str UNIQUE NOT NULL,
  address text  NOT NULL
);

CREATE TABLE tb_bss_usr (
  id_email    integer PRIMARY KEY,
  has_profile boolean NOT NULL,
  has_phone   boolean NOT NULL,
  creation    timestamp NOT NULL,
  id_role     integer NOT NULL,
  id_super    integer,
  id_agency   integer NOT NULL
);

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


CREATE TABLE tb_ads_type (
  id    serial PRIMARY KEY,
  type  dm_smp_str UNIQUE NOT NULL
);

CREATE TABLE tb_estate_type (
  id    serial PRIMARY KEY,
  type  dm_smp_str UNIQUE NOT NULL
);

CREATE TABLE tb_furniture_type (
  id    serial PRIMARY KEY,
  type  dm_smp_str UNIQUE NOT NULL
);

CREATE TABLE tb_energy_class_type (
  id    serial PRIMARY KEY,
  type  dm_smp_str UNIQUE NOT NULL
);

CREATE TABLE tb_heating_type (
  id    serial PRIMARY KEY,
  type  dm_smp_str UNIQUE NOT NULL
);

CREATE TABLE tb_air_cond_type (
  id    serial PRIMARY KEY,
  type  dm_smp_str UNIQUE NOT NULL
);

CREATE TABLE tb_property_type (
  id    serial PRIMARY KEY,
  type  dm_smp_str UNIQUE NOT NULL
);

CREATE TABLE tb_condition_type (
  id    serial PRIMARY KEY,
  type  dm_smp_str UNIQUE NOT NULL
);

CREATE TABLE tb_rental_contract_type (
  id    serial PRIMARY KEY,
  type  dm_smp_str UNIQUE NOT NULL
);

CREATE TABLE tb_rental_utilities_type (
  id    serial PRIMARY KEY,
  type  dm_smp_str UNIQUE NOT NULL
);

CREATE TABLE tb_estate (
  id              serial PRIMARY KEY,
  id_bss_usr      integer NOT NULL,
  id_estate_type  integer NOT NULL,
  position        text NOT NULL, -- TODO: remember the canna da zucchero
  id_ads_type     integer NOT NULL,
  is_available    boolean NOT NULL
);

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

CREATE TABLE tb_feature_sz (
  id_estate       integer PRIMARY KEY,
  main_area       dm_int0plus NOT NULL,
  storage_area    dm_int0plus NOT NULL DEFAULT 0,
  terrace_area    dm_int0plus NOT NULL DEFAULT 0,
  balcony_area    dm_int0plus NOT NULL DEFAULT 0,
  garder_area     dm_int0plus NOT NULL DEFAULT 0,
  garage_area     dm_int0plus NOT NULL DEFAULT 0,
  n_indoor_park   dm_int0plus NOT NULL DEFAULT 0, 
  n_outdoor_park  dm_int0plus NOT NULL DEFAULT 0 
);

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

CREATE TABLE tb_feature_floor (
  id_estate       integer PRIMARY KEY,
  total_floor     dm_int0plus NOT NULL,
  elevators       dm_int0plus NOT NULL DEFAULT 0,
  estate_floor    dm_int0plus NOT NULL,
  disabled_access boolean NOT NULL DEFAULT false
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

CREATE TABLE tb_feature_comp (
  id_estate                integer PRIMARY KEY,
  rooms                    dm_int0plus NOT NULL,
  bathrooms                dm_int0plus NOT NULL DEFAULT 0,
  kitchens                 dm_int0plus NOT NULL DEFAULT 0,
  liveable_kitchen         boolean NOT NULL DEFAULT false,
  bedrooms                 dm_int0plus NOT NULL DEFAULT 0,
  id_type_furniture        integer NOT NULL
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
    kitchens > 0 OR liveable_kitchen = false
  );

CREATE TABLE tb_feature_energy_eff (
  id_estate                integer PRIMARY KEY,
  id_energy_class_type     integer NOT NULL,
  energy_performance_index dm_int0plus NOT NULL, -- TODO change with acronym
  id_heating_type          integer NOT NULL,
  id_air_cond_type         integer NOT NULL
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

CREATE TABLE tb_feature_condition (
  id_estate                integer PRIMARY KEY,
  id_type_property         integer NOT NULL,
  id_type_condition        integer NOT NULL,
  construction_year        dm_int0plus NOT NULL
);

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

-- ! I added a lot of things here, we need to discuss this
CREATE TABLE tb_feature_other (
  id_estate                integer PRIMARY KEY,
  near_school              boolean NOT NULL DEFAULT false,
  near_park                boolean NOT NULL DEFAULT false,
  near_shopping            boolean NOT NULL DEFAULT false,
  near_transport           boolean NOT NULL DEFAULT false,
  near_restaurant          boolean NOT NULL DEFAULT false,
  near_hospital            boolean NOT NULL DEFAULT false,
  near_police              boolean NOT NULL DEFAULT false,
  near_fire_station        boolean NOT NULL DEFAULT false,
  near_bank                boolean NOT NULL DEFAULT false,
  near_post_office         boolean NOT NULL DEFAULT false,
  near_gas_station         boolean NOT NULL DEFAULT false,
  near_library             boolean NOT NULL DEFAULT false,
  near_cinema              boolean NOT NULL DEFAULT false,
  near_theatre             boolean NOT NULL DEFAULT false,
  near_museum              boolean NOT NULL DEFAULT false,
  near_zoo                 boolean NOT NULL DEFAULT false,
  near_aquarium            boolean NOT NULL DEFAULT false,
  near_gym                 boolean NOT NULL DEFAULT false,
  near_swimming_pool       boolean NOT NULL DEFAULT false,
  near_sports_facility     boolean NOT NULL DEFAULT false,
  near_university          boolean NOT NULL DEFAULT false,
  near_kindergarten        boolean NOT NULL DEFAULT false,
  near_primary_school      boolean NOT NULL DEFAULT false,
  near_secondary_school    boolean NOT NULL DEFAULT false,
  near_high_school         boolean NOT NULL DEFAULT false,
  lgbt_friendly            boolean NOT NULL DEFAULT false,
  pet_friendly             boolean NOT NULL DEFAULT false
);


ALTER TABLE tb_feature_other
  ADD CONSTRAINT feature_other_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;

CREATE TABLE tb_price (
  id_estate         integer PRIMARY KEY,
  price             dm_int0plus NOT NULL,
  condom_exp        dm_int0plus NOT NULL DEFAULT 0,
  income_property   boolean NOT NULL DEFAULT false,
  is_free           boolean NOT NULL DEFAULT false,
  is_negotiable     boolean NOT NULL DEFAULT false
);

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

CREATE TABLE tb_rental_info (
  id_estate                 integer PRIMARY KEY,
  id_rental_contract_type   integer NOT NULL,
  rent_to_own               boolean NOT NULL DEFAULT false,
  roommates                 boolean NOT NULL DEFAULT false,
  id_rental_utilities_type  integer NOT NULL
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

-- TODO refine stats tables

CREATE TABLE tb_email_views (
  id_email  integer NOT NULL,
  id_estate integer NOT NULL,
  view_date date NOT NULL,
  views     dm_int0plus NOT NULL
);

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

CREATE TABLE tb_email_booking (
  id_email     integer NOT NULL,
  id_estate    integer NOT NULL,
  date         date NOT NULL,
  bookings     dm_int0plus NOT NULL
);

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

CREATE TABLE tb_email_offer (
  id_email     integer NOT NULL,
  id_estate    integer NOT NULL,
  offer_date   date NOT NULL,
  offers       dm_int0plus NOT NULL,
  offer_price  dm_int0plus NOT NULL -- Last offer price
);

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

CREATE TABLE estate_statistic (
  id_estate integer PRIMARY KEY,
  views     dm_int0plus NOT NULL DEFAULT 0,
  bookings  dm_int0plus NOT NULL DEFAULT 0,
  offers    dm_int0plus NOT NULL DEFAULT 0,
  date      date NOT NULL
);

ALTER TABLE estate_statistic
  ADD CONSTRAINT estate_statistic_fk_estate
  FOREIGN KEY (id_estate) REFERENCES tb_estate(id)
  ON DELETE cascade
  ON UPDATE cascade;
