/******************************************************************************
 * TYPE: table
 * NAME: tb_available_estate
 *
 * DESC: main table storing available real estate property listings
 *****************************************************************************/
CREATE TABLE tb_available_estate (
    id_estate       integer PRIMARY KEY,
    time_stamp      timestamp NOT NULL DEFAULT NOW(),         
    id_bss_usr      integer NOT NULL,
    id_estate_type  integer NOT NULL,
    id_address      integer NOT NULL,
    id_ads_type     integer NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_available_feature_sz
 *
 * DESC: table storing size-related features of properties
 *****************************************************************************/
CREATE TABLE tb_available_feature_sz (
    id_estate       integer PRIMARY KEY,
    total_area      dm_int0plus GENERATED ALWAYS AS (
                        fn_calculate_tot_area(
                            main_area,
                            storage_area,
                            terrace_area,
                            balcony_area,
                            garden_area,
                            garage_area,
                            n_indoor_park,
                            n_outdoor_park
                        )
                    ) STORED,
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
 * NAME: tb_available_feature_floor
 *
 * DESC: table storing floor-related features and accessibility information
 *****************************************************************************/
CREATE TABLE tb_available_feature_floor (
    id_estate       integer PRIMARY KEY,
    total_floor     dm_int0plus NOT NULL,
    elevators       dm_int0plus NOT NULL DEFAULT 0,
    estate_floor    dm_int0plus NOT NULL,
    disabled_access boolean NOT NULL DEFAULT false
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_available_feature_comp
 *
 * DESC: table storing composition features of properties
 *       (rooms, bathrooms, etc.)
 *****************************************************************************/
CREATE TABLE tb_available_feature_comp (
    id_estate           integer PRIMARY KEY,
    rooms               dm_int0plus NOT NULL,
    bathrooms           dm_int0plus NOT NULL DEFAULT 0,
    kitchens            dm_int0plus NOT NULL DEFAULT 0,
    liveable_kitchen    boolean NOT NULL DEFAULT false,
    bedrooms            dm_int0plus NOT NULL DEFAULT 0,
    id_furniture_type   integer NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_available_feature_energy_eff
 *
 * DESC: table storing energy efficiency features of properties
 *****************************************************************************/
CREATE TABLE tb_available_feature_energy_eff (
    id_estate               integer PRIMARY KEY,
    id_energy_class_type    integer NOT NULL,
    epgl                    dm_int0plus NOT NULL,
    id_heating_type         integer NOT NULL,
    id_air_cond_type        integer NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_available_feature_condition
 *
 * DESC: table storing property condition and ownership information
 *****************************************************************************/
CREATE TABLE tb_available_feature_condition (
    id_estate           integer PRIMARY KEY,
    id_property_type    integer NOT NULL,
    id_condition_type   integer NOT NULL,
    construction_year   dm_int0plus NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_available_feature_other
 *
 * DESC: table storing proximity to amenities and other property features
 *****************************************************************************/
CREATE TABLE tb_available_feature_other (
    id_estate               integer PRIMARY KEY,
    near_school             boolean NOT NULL DEFAULT false,
    near_kindergarten       boolean NOT NULL DEFAULT false,
    near_university         boolean NOT NULL DEFAULT false,
    near_park               boolean NOT NULL DEFAULT false,
    near_shopping           boolean NOT NULL DEFAULT false,
    near_market             boolean NOT NULL DEFAULT false,
    near_transport          boolean NOT NULL DEFAULT false,
    near_subway             boolean NOT NULL DEFAULT false,
    near_catering           boolean NOT NULL DEFAULT false,
    near_healthcare         boolean NOT NULL DEFAULT false,
    near_laisure            boolean NOT NULL DEFAULT false,
    near_nature             boolean NOT NULL DEFAULT false,
    near_office             boolean NOT NULL DEFAULT false,
    near_parking            boolean NOT NULL DEFAULT false,
    near_railway            boolean NOT NULL DEFAULT false,
    near_airpoty            boolean NOT NULL DEFAULT false,
    near_service            boolean NOT NULL DEFAULT false,
    near_beach              boolean NOT NULL DEFAULT false,
    near_adult              boolean NOT NULL DEFAULT false,
    near_heritage           boolean NOT NULL DEFAULT false,
    near_entertainment      boolean NOT NULL DEFAULT false,
    near_sport              boolean NOT NULL DEFAULT false,
    populated_area          boolean NOT NULL DEFAULT false,
    low_emission_zone       boolean NOT NULL DEFAULT false,
    lgbt_friendly           boolean NOT NULL DEFAULT false,
    pet_friendly            boolean NOT NULL DEFAULT false,
    opt_fiber_coverage      boolean NOT NULL DEFAULT false
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_available_price
 *
 * DESC: table storing price-related information for properties
 *****************************************************************************/
CREATE TABLE tb_available_price (
    id_estate       integer PRIMARY KEY,
    price           dm_int0plus NOT NULL,
    condo_fees      dm_int0plus NOT NULL DEFAULT 0,
    income_property boolean NOT NULL DEFAULT false,
    is_free         boolean NOT NULL DEFAULT false,
    is_negotiable   boolean NOT NULL DEFAULT false
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_available_rental_info
 *
 * DESC: table storing rental-specific information for rental properties
 *****************************************************************************/
CREATE TABLE tb_available_rental_info (
    id_estate                   integer PRIMARY KEY,
    id_rental_contract_type     integer NOT NULL,
    rent_to_own                 boolean NOT NULL DEFAULT false,
    roommates                   boolean NOT NULL DEFAULT false,
    id_rental_utilities_type    integer NOT NULL
);
-------------------------------------------------------------------------------
