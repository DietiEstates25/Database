CREATE VIEW vw_end_usr AS
SELECT
    tb_usr.creation         AS 'registrated',
    tb_usr.id               AS 'id',
    tb_usr.email            AS 'email',
    tb_usr_data.first_name  AS 'first name',
    tb_usr_data.last_name   AS 'last name',
    tb_usr_data.dob         AS 'birth date',
    tb_usr_data.gender      AS 'gender',
    tb_phone.phone          AS 'phone number',
    tb_usr_type.type        AS 'role',
    tb_usr_type.is_bss      AS 'is business'
FROM tb_usr
    JOIN tb_urs_type
        ON tb_usr.id_usr_type = tb_usr_type.id
    RIGHT OUTER JOIN tb_usr_data
        ON tb_usr.id = tb_usr_data.id_usr
    RIGHT OUTER JOIN tb_phone
        ON tb_usr.id = tb_phone.id_usr;


CREATE VIEW vw_bss_usr AS
SELECT
    tb_usr.creation         AS 'registrated',
    tb_usr.id               AS 'id',
    tb_usr.email            AS 'email',
    tb_usr_data.first_name  AS 'first name',
    tb_usr_data.last_name   AS 'last name',
    tb_usr_data.dob         AS 'birth date',
    tb_usr_data.gender      AS 'gender',
    tb_phone.phone          AS 'phone number',
    tb_usr_type.type        AS 'role',
    tb_usr_type.is_bss      AS 'is business',
    tb_usr_super.email      AS 'email super',
    tb_agency.name          AS 'agency'
FROM tb_usr
    JOIN tb_urs_type
        ON tb_usr.id_usr_type = tb_usr_type.id
    JOIN tb_usr_data
        ON tb_usr.id = tb_usr_data.id_usr
    JOIN tb_phone
        ON tb_usr.id = tb_phone.id_usr
    JOIN tb_bss_usr
        ON tb_usr.id = tb_bss_usr.id_usr
    RIGHT OUTER JOIN tb_usr tb_usr_super
        ON tb_bss_usr.id_super = tb_usr_super.id
    JOIN tb_agency
        ON tb_bss_usr.id_agency = tb_agency.id;
    

CREATE VIEW vw_estate_sell AS
SELECT
    tb_estate.id                        AS 'id',
    tb_estate.time_stamp                AS 'creation',
    tb_estate.is_sold                   AS 'is_sold',
    tb_estate_type.type                 AS 'estate_type',
    tb_ads_type.type                    AS 'advertisment_type',
    tb_feature_sz.total_area            AS 'total_area',
    tb_feature_sz.main_area             AS 'main_area',
    tb_feature_sz.storage_area          AS 'storage_area',
    tb_feature_sz.terrace_area          AS 'terrace_area',
    tb_feature_sz.balcony_area          AS 'balcony_area',
    tb_feature_sz.garden_area           AS 'garden_area',
    tb_feature_sz.garage_area           AS 'garage_area',
    tb_feature_sz.n_indoor_park         AS 'indoor_park'
    tb_feature_sz.n_outdoor_park        AS 'outdoor_park',
    tb_feature_floor.total_floor        AS 'total_floor',
    tb_feature_floor.elevators          AS 'elevators',
    tb_feature_floor.estate_floor       AS 'estate_floor',
    tb_feature_floor.disabled_access    AS 'disabled_acces',
    tb_feature_comp.bathrooms           AS 'bathrooms',
    tb_feature_comp.kitchens            AS 'kitchens',
    tb_feature_comp.liveable_kitchen    AS 'liveable_kitchen',
    tb_feature_comp.bedrooms            AS 'bedrooms',
    tb_feature_comp.AS '',
FROM tb_estate
    JOIN tb_address
        ON tb_estate.id_address = tb_address.id
    JOIN tb_estate_type
        ON tb_estate.id_estate_type = tb_estate_type.id
    JOIN tb_ads_type
        ON tb_estate.id_ads_type = tb_ads_type.id
    JOIN tb_feature_sz
        ON tb_estate.id = tb_feature_sz.id_estate
    JOIN tb_feature_floor
        ON tb_estate.id = tb_feature_floor.id_estate
    JOIN tb_feature_comp
        ON tb_estate.id = tb_feature_comp.id_estate
    JOIN tb_furniture_type
        ON tb_feature_comp.id_type_furniture = tb_furniture_type.id -- TODO: continue from here
    JOIN tb_feature_energy_eff
        ON tb_estate.id = tb_feature_energy_eff.id_estate
    JOIN tb_feature_condition
        ON tb_estate.id = tb_feature_condition.id_estate
    JOIN tb_feature_other
        ON tb_estate.id = tb_feature_other.id_estate
    JOIN tb_price
        ON tb_estate.id = tb_price.id_estate;




