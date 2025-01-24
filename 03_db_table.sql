/******************************************************************************
  * TYPE: table
  * NAME: tb_asd_type
  *
  * DESC: table of the possible types of real estate advertisment
 ******************************************************************************/
CREATE TABLE tb_ads_type (
    id      serial PRIMARY KEY,
    type    dm_smp_str UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_estate_type
  *
  * DESC: table of the possible types of real estate properties
  *       (apartment, house, etc.)
 ******************************************************************************/
CREATE TABLE tb_estate_type (
    id      serial PRIMARY KEY,
    type    dm_smp_str UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_furniture_type
  *
  * DESC: table of the possible furniture states of properties
  *       (furnished, unfurnished, etc.)
 ******************************************************************************/
CREATE TABLE tb_furniture_type (
    id      serial PRIMARY KEY,
    type    dm_smp_str UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_energy_class_type
  *
  * DESC: table of energy efficiency classifications for properties
  *       (A, B, C, etc.)
 ******************************************************************************/
CREATE TABLE tb_energy_class_type (
    id      serial PRIMARY KEY,
    type    dm_smp_str UNIQUE NOT NULL
);
-------------------------------------------------------------------------------
 

/******************************************************************************
  * TYPE: table
  * NAME: tb_heating_type
  *
  * DESC: table of possible heating system types
  *       (central, autonomous, etc.)
 ******************************************************************************/
CREATE TABLE tb_heating_type (
    id      serial PRIMARY KEY,
    type    dm_smp_str UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_air_cond_type
  *
  * DESC: table of possible air conditioning system types
 ******************************************************************************/
CREATE TABLE tb_air_cond_type (
    id      serial PRIMARY KEY,
    type    dm_smp_str UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_property_type
  *
  * DESC: table of property ownership types
  *       (freehold, leasehold, etc.)
 ******************************************************************************/
CREATE TABLE tb_property_type (
    id      serial PRIMARY KEY,
    type    dm_smp_str UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_condition_type
  *
  * DESC: table of possible property conditions
  *       (new, renovated, to be renovated, etc.)
 ******************************************************************************/
CREATE TABLE tb_condition_type (
    id      serial PRIMARY KEY,
    type    dm_smp_str UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_rental_contract_type
  *
  * DESC: table of possible rental contract types
  *       (short-term, long-term, etc.)
 ******************************************************************************/
CREATE TABLE tb_rental_contract_type (
    id      serial PRIMARY KEY,
    type    dm_smp_str UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_rental_utilities_type
  *
  * DESC: table of possible utility inclusion types in rental properties
 ******************************************************************************/
CREATE TABLE tb_rental_utilities_type (
    id      serial PRIMARY KEY,
    type    dm_smp_str UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_email
  *
  * DESC: table storing unique email addresses for all system users
 ******************************************************************************/
CREATE TABLE tb_email (
    id      serial PRIMARY KEY,
    email   dm_email UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_usr_data
  *
  * DESC: table storing personal information of all system users
 ******************************************************************************/
CREATE TABLE tb_usr_data (
    id_email    integer PRIMARY KEY,
    firs_name   dm_smp_str NOT NULL,
    last_name   dm_smp_str NOT NULL,
    dob         dm_dob NOT NULL,
    gender      ty_gender NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_phone
  *
  * DESC: table storing phone numbers associated with user email addresses
 ******************************************************************************/
CREATE TABLE tb_phone (
    id_email    integer PRIMARY KEY,
    phone       dm_phone UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_bss_role
  *
  * DESC: table defining business user roles and their hierarchical relationships
 ******************************************************************************/
CREATE TABLE tb_bss_role (
    hierarchy   dm_int0plus PRIMARY KEY,    -- bottom up
    role        dm_smp_str UNIQUE NOT NULL
);
-------------------------------------------------------------------------------



-- TODO: idea. Let's think about it
/******************************************************************************
  * TYPE: table
  * NAME: tb_address
  *
  * DESC: table storing geographical location and address details for properties
 ******************************************************************************/
CREATE TABLE tb_address (
    id              serial PRIMARY KEY,
    street_address  text NOT NULL,
    street_number   text NOT NULL,
    neighborhood    text NOT NULL,
    city            text NOT NULL,
    state_province  text NOT NULL,
    postal_code     text NOT NULL,
    country         text NOT NULL,
    latitude        decimal(10,8) NOT NULL,
    longitude       decimal(11,8) NOT NULL
--    coordinate      geometry(Point, 4326) NOT NULL
);
-------------------------------------------------------------------------------

-- ! Agency should have an email? or we can use root admin email?
/******************************************************************************
  * TYPE: table
  * NAME: tb_agency
  *
  * DESC: table storing real estate agency information
 ******************************************************************************/
CREATE TABLE tb_agency (
    id          serial PRIMARY KEY,
    name        dm_smp_str UNIQUE NOT NULL,
    id_address  integer NOT NULL
--    address text  NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_end_usr
  *
  * DESC: table storing end user account information and verification status
 ******************************************************************************/
CREATE TABLE tb_end_usr (
    id_email        integer PRIMARY KEY,
    has_profile     boolean NOT NULL,
    has_phone       boolean NOT NULL,
    creation        timestamp NOT NULL DEFAULT NOW(),
    verified_email  boolean NOT NULL DEFAULT false,
    verified_phone  boolean NOT NULL DEFAULT false
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_bss_usr
  *
  * DESC: table storing business user information including role
  *       and agency affiliations
 ******************************************************************************/
CREATE TABLE tb_bss_usr (
    id_email    integer PRIMARY KEY,
    creation    timestamp NOT NULL DEFAULT NOW(),
    id_role     integer NOT NULL,
    id_super    integer,
    id_agency   integer NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_tmp_bss_usr
  *
  * DESC: temporary table for business user registration process
 ******************************************************************************/
CREATE TABLE tb_tmp_bss_usr (
    id_email    integer PRIMARY KEY,
    has_profile boolean NOT NULL DEFAULT false,
    has_phone   boolean NOT NULL DEFAULT false,
    creation    timestamp NOT NULL DEFAULT NOW(),
    id_role     integer NOT NULL,
    id_super    integer,
    id_agency   integer NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_estate
  *
  * DESC: main table storing real estate property listings
 ******************************************************************************/
CREATE TABLE tb_estate (
    id              serial PRIMARY KEY,
    time_stamp      timestamp NOT NULL DEFAULT NOW(),         
    id_bss_usr      integer NOT NULL,
    id_estate_type  integer NOT NULL,
    id_address      integer NOT NULL,
--    position        text NOT NULL, -- TODO: remember the canna da zucchero
    id_ads_type     integer NOT NULL,
    is_sold         boolean NOT NULL DEFAULT false
);
-------------------------------------------------------------------------------

-- ! Updated the table to have nullable fields
/******************************************************************************
  * TYPE: table
  * NAME: tb_tmp_estate
  *
  * DESC: temporary table for property listing creation process
 ******************************************************************************/
CREATE TABLE tb_tmp_estate (
    id              serial PRIMARY KEY,
    time_stamp      timestamp NOT NULL DEFAULT NOW(),         
    id_bss_usr      integer NOT NULL,
    id_estate_type  integer NOT NULL,
    id_address      integer ,
    -- position     text, -- TODO: remember the canna da zucchero
    id_ads_type     integer NOT NULL,
    is_completed    boolean DEFAULT false
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_feature_sz
  *
  * DESC: table storing size-related features of properties
 ******************************************************************************/
CREATE TABLE tb_feature_sz (
    id_estate       integer PRIMARY KEY,
    main_area       dm_int0plus NOT NULL,
    storage_area    dm_int0plus NOT NULL DEFAULT 0,
    terrace_area    dm_int0plus NOT NULL DEFAULT 0,
    balcony_area    dm_int0plus NOT NULL DEFAULT 0,
    garden_area     dm_int0plus NOT NULL DEFAULT 0,
    garage_area     dm_int0plus NOT NULL DEFAULT 0,
    n_indoor_park   dm_int0plus NOT NULL DEFAULT 0, 
    n_outdoor_park  dm_int0plus NOT NULL DEFAULT 0 
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_tmp_feature_sz
  *
  * DESC: temporary table for size-related features during property creation
 ******************************************************************************/
CREATE TABLE tb_tmp_feature_sz (
    id_estate       integer PRIMARY KEY,
    main_area       dm_int0plus NOT NULL,
    storage_area    dm_int0plus NOT NULL DEFAULT 0,
    terrace_area    dm_int0plus NOT NULL DEFAULT 0,
    balcony_area    dm_int0plus NOT NULL DEFAULT 0,
    garden_area     dm_int0plus NOT NULL DEFAULT 0,
    garage_area     dm_int0plus NOT NULL DEFAULT 0,
    n_indoor_park   dm_int0plus NOT NULL DEFAULT 0, 
    n_outdoor_park  dm_int0plus NOT NULL DEFAULT 0 
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_feature_floor
  *
  * DESC: table storing floor-related features and accessibility information
 ******************************************************************************/
CREATE TABLE tb_feature_floor (
    id_estate       integer PRIMARY KEY,
    total_floor     dm_int0plus NOT NULL,
    elevators       dm_int0plus NOT NULL DEFAULT 0,
    estate_floor    dm_int0plus NOT NULL,
    disabled_access boolean NOT NULL DEFAULT false
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_tmp_feature_floor
  *
  * DESC: temporary table for floor-related features during property creation
 ******************************************************************************/
CREATE TABLE tb_tmp_feature_floor (
    id_estate       integer PRIMARY KEY,
    total_floor     dm_int0plus NOT NULL,
    elevators       dm_int0plus NOT NULL DEFAULT 0,
    estate_floor    dm_int0plus NOT NULL,
    disabled_access boolean NOT NULL DEFAULT false
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_feature_comp
  *
  * DESC: table storing composition features of properties
  *       (rooms, bathrooms, etc.)
 ******************************************************************************/
CREATE TABLE tb_feature_comp (
    id_estate           integer PRIMARY KEY,
    rooms               dm_int0plus NOT NULL,
    bathrooms           dm_int0plus NOT NULL DEFAULT 0,
    kitchens            dm_int0plus NOT NULL DEFAULT 0,
    liveable_kitchen    boolean NOT NULL DEFAULT false,
    bedrooms            dm_int0plus NOT NULL DEFAULT 0,
    id_type_furniture   integer NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_tmp_feature_comp
  *
  * DESC: temporary table for composition features during property creation
 ******************************************************************************/
CREATE TABLE tb_tmp_feature_comp (
    id_estate           integer PRIMARY KEY,
    rooms               dm_int0plus NOT NULL,
    bathrooms           dm_int0plus NOT NULL DEFAULT 0,
    kitchens            dm_int0plus NOT NULL DEFAULT 0,
    liveable_kitchen    boolean NOT NULL DEFAULT false,
    bedrooms            dm_int0plus NOT NULL DEFAULT 0,
    id_type_furniture   integer NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_feature_energy_eff
  *
  * DESC: table storing energy efficiency features of properties
 ******************************************************************************/
CREATE TABLE tb_feature_energy_eff (
    id_estate               integer PRIMARY KEY,
    id_energy_class_type    integer NOT NULL,
    energy_perf_indx        dm_int0plus NOT NULL, -- TODO change with acronym
    id_heating_type         integer NOT NULL,
    id_air_cond_type        integer NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_tmp_feature_energy_eff
  *
  * DESC: temporary table for energy efficiency features during
  *       property creation
 ******************************************************************************/
CREATE TABLE tb_tmp_feature_energy_eff (
    id_estate               integer PRIMARY KEY,
    id_energy_class_type    integer NOT NULL,
    energy_perf_indx        dm_int0plus NOT NULL, -- TODO change with acronym
    id_heating_type         integer NOT NULL,
    id_air_cond_type        integer NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_feature_condition
  *
  * DESC: table storing property condition and ownership information
 ******************************************************************************/
CREATE TABLE tb_feature_condition (
    id_estate           integer PRIMARY KEY,
    id_type_property    integer NOT NULL,
    id_type_condition   integer NOT NULL,
    construction_year   dm_int0plus NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_tmp_feature_condition
  *
  * DESC: temporary table for condition features during property creation
 ******************************************************************************/
CREATE TABLE tb_tmp_feature_condition (
    id_estate           integer PRIMARY KEY,
    id_type_property    integer NOT NULL,
    id_type_condition   integer NOT NULL,
    construction_year   dm_int0plus NOT NULL
);
-------------------------------------------------------------------------------

-- ! I added a lot of things here, we need to discuss this

/******************************************************************************
  * TYPE: table
  * NAME: tb_feature_other
  *
  * DESC: table storing proximity to amenities and other property features
 ******************************************************************************/
CREATE TABLE tb_feature_other (
    id_estate               integer PRIMARY KEY,
    near_school             boolean NOT NULL DEFAULT false,
    near_park               boolean NOT NULL DEFAULT false,
    near_shopping           boolean NOT NULL DEFAULT false,
    near_transport          boolean NOT NULL DEFAULT false,
    near_restaurant         boolean NOT NULL DEFAULT false,
    near_hospital           boolean NOT NULL DEFAULT false,
    near_police             boolean NOT NULL DEFAULT false,
    near_fire_station       boolean NOT NULL DEFAULT false,
    near_bank               boolean NOT NULL DEFAULT false,
    near_post_office        boolean NOT NULL DEFAULT false,
    near_gas_station        boolean NOT NULL DEFAULT false,
    near_library            boolean NOT NULL DEFAULT false,
    near_cinema             boolean NOT NULL DEFAULT false,
    near_theatre            boolean NOT NULL DEFAULT false,
    near_museum             boolean NOT NULL DEFAULT false,
    near_zoo                boolean NOT NULL DEFAULT false,
    near_aquarium           boolean NOT NULL DEFAULT false,
    near_gym                boolean NOT NULL DEFAULT false,
    near_swimming_pool      boolean NOT NULL DEFAULT false,
    near_sports_facility    boolean NOT NULL DEFAULT false,
    near_university         boolean NOT NULL DEFAULT false,
    near_kindergarten       boolean NOT NULL DEFAULT false,
    near_primary_school     boolean NOT NULL DEFAULT false,
    near_secondary_school   boolean NOT NULL DEFAULT false,
    near_high_school        boolean NOT NULL DEFAULT false,
    lgbt_friendly           boolean NOT NULL DEFAULT false,
    pet_friendly            boolean NOT NULL DEFAULT false
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_tmp_feature_other
  *
  * DESC: temporary table for amenity and other features during
  *       property creation
 ******************************************************************************/
CREATE TABLE tb_tmp_feature_other (
    id_estate               integer PRIMARY KEY,
    near_school             boolean NOT NULL DEFAULT false,
    near_park               boolean NOT NULL DEFAULT false,
    near_shopping           boolean NOT NULL DEFAULT false,
    near_transport          boolean NOT NULL DEFAULT false,
    near_restaurant         boolean NOT NULL DEFAULT false,
    near_hospital           boolean NOT NULL DEFAULT false,
    near_police             boolean NOT NULL DEFAULT false,
    near_fire_station       boolean NOT NULL DEFAULT false,
    near_bank               boolean NOT NULL DEFAULT false,
    near_post_office        boolean NOT NULL DEFAULT false,
    near_gas_station        boolean NOT NULL DEFAULT false,
    near_library            boolean NOT NULL DEFAULT false,
    near_cinema             boolean NOT NULL DEFAULT false,
    near_theatre            boolean NOT NULL DEFAULT false,
    near_museum             boolean NOT NULL DEFAULT false,
    near_zoo                boolean NOT NULL DEFAULT false,
    near_aquarium           boolean NOT NULL DEFAULT false,
    near_gym                boolean NOT NULL DEFAULT false,
    near_swimming_pool      boolean NOT NULL DEFAULT false,
    near_sports_facility    boolean NOT NULL DEFAULT false,
    near_university         boolean NOT NULL DEFAULT false,
    near_kindergarten       boolean NOT NULL DEFAULT false,
    near_primary_school     boolean NOT NULL DEFAULT false,
    near_secondary_school   boolean NOT NULL DEFAULT false,
    near_high_school        boolean NOT NULL DEFAULT false,
    lgbt_friendly           boolean NOT NULL DEFAULT false,
    pet_friendly            boolean NOT NULL DEFAULT false
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_price
  *
  * DESC: table storing price-related information for properties
 ******************************************************************************/
CREATE TABLE tb_price (
    id_estate       integer PRIMARY KEY,
    price           dm_int0plus NOT NULL,
    condom_exp      dm_int0plus NOT NULL DEFAULT 0,
    income_property boolean NOT NULL DEFAULT false,
    is_free         boolean NOT NULL DEFAULT false,
    is_negotiable   boolean NOT NULL DEFAULT false
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_tmp_price
  *
  * DESC: temporary table for price information during property creation
 ******************************************************************************/
CREATE TABLE tb_tmp_price (
    id_estate       integer PRIMARY KEY,
    price           dm_int0plus NOT NULL,
    condom_exp      dm_int0plus NOT NULL DEFAULT 0,
    income_property boolean NOT NULL DEFAULT false,
    is_free         boolean NOT NULL DEFAULT false,
    is_negotiable   boolean NOT NULL DEFAULT false
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_rental_info
  *
  * DESC: table storing rental-specific information for rental properties
 ******************************************************************************/
CREATE TABLE tb_rental_info (
    id_estate                   integer PRIMARY KEY,
    id_rental_contract_type     integer NOT NULL,
    rent_to_own                 boolean NOT NULL DEFAULT false,
    roommates                   boolean NOT NULL DEFAULT false,
    id_rental_utilities_type    integer NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_tmp_rental_info
  *
  * DESC: temporary table for rental information during property creation
 ******************************************************************************/
CREATE TABLE tb_tmp_rental_info (
    id_estate                   integer PRIMARY KEY,
    id_rental_contract_type     integer NOT NULL,
    rent_to_own                 boolean NOT NULL DEFAULT false,
    roommates                   boolean NOT NULL DEFAULT false,
    id_rental_utilities_type    integer NOT NULL
);
-------------------------------------------------------------------------------

-- TODO refine stats tables


/******************************************************************************
  * TYPE: table
  * NAME: tb_email_views
  *
  * DESC: table tracking property views by users
 ******************************************************************************/
CREATE TABLE tb_email_views (
    id_email    integer NOT NULL,
    id_estate   integer NOT NULL,
    time_stamp  timestamp NOT NULL DEFAULT NOW(),
    views       dm_int0plus NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_email_booking
  *
  * DESC: table tracking property viewing appointments booked by users
 ******************************************************************************/
CREATE TABLE tb_email_booking (
    id_email    integer NOT NULL,
    id_estate   integer NOT NULL,
    time_stamp  timestamp NOT NULL DEFAULT NOW()
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: tb_email_offer
  *
  * DESC: table tracking offers made by users on properties
 ******************************************************************************/
CREATE TABLE tb_email_offer (
    id_email    integer NOT NULL,
    id_estate   integer NOT NULL,
    time_stamp  timestamp NOT NULL DEFAULT NOW(),
    offer_price dm_int0plus NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
  * TYPE: table
  * NAME: estate_statistic
  *
  * DESC: table storing daily aggregated statistics for properties
 ******************************************************************************/
CREATE TABLE estate_statistic (
    id_estate   integer PRIMARY KEY,
    views       dm_int0plus NOT NULL DEFAULT 0,
    bookings    dm_int0plus NOT NULL DEFAULT 0,
    offers      dm_int0plus NOT NULL DEFAULT 0,
    date        date NOT NULL
);
-------------------------------------------------------------------------------
