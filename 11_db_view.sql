CREATE VIEW vw_end_usr AS
SELECT
    tb_usr.creation         AS "creation",
    tb_usr.id               AS "id",
    tb_usr.email            AS "email",
    tb_usr_data.first_name  AS "first_name",
    tb_usr_data.last_name   AS "last_name",
    tb_usr_data.dob         AS "dob",
    tb_usr_data.gender      AS "gender",
    tb_phone.phone          AS "phone",
    tb_usr_type.type        AS "role",
    tb_usr_type.is_bss      AS "is_bss"
FROM tb_usr
    JOIN tb_usr_type
        ON tb_usr.id_usr_type = tb_usr_type.id
    LEFT OUTER JOIN tb_usr_data
        ON tb_usr.id = tb_usr_data.id_usr
    LEFT OUTER JOIN tb_phone
        ON tb_usr.id = tb_phone.id_usr
WHERE
    tb_usr.is_bss;


CREATE VIEW vw_bss_usr AS
SELECT
    tb_usr.creation         AS "creation",
    tb_usr.id               AS "id",
    tb_usr.email            AS "email",
    tb_usr_data.first_name  AS "first_name",
    tb_usr_data.last_name   AS "last_name",
    tb_usr_data.dob         AS "dob",
    tb_usr_data.gender      AS "gender",
    tb_phone.phone          AS "phone",
    tb_usr_type.type        AS "role",
    tb_usr_type.is_bss      AS "is_bss",
    tb_usr_super.email      AS "email_super",
    tb_agency.name          AS "agency"
FROM tb_usr
    JOIN tb_usr_type
        ON tb_usr.id_usr_type = tb_usr_type.id
    JOIN tb_usr_data
        ON tb_usr.id = tb_usr_data.id_usr
    JOIN tb_phone
        ON tb_usr.id = tb_phone.id_usr
    JOIN tb_bss_usr
        ON tb_usr.id = tb_bss_usr.id_usr
    LEFT OUTER JOIN tb_usr tb_usr_super
        ON tb_bss_usr.id_super = tb_usr_super.id
    JOIN tb_agency
        ON tb_bss_usr.id_agency = tb_agency.id;
    

CREATE VIEW vw_estate_sell AS
SELECT
    tb_estate.id                            AS "id",
    tb_estate.time_stamp                    AS "time_stamp",
    tb_estate.is_sold                       AS "is_sold",
    tb_estate_type.type                     AS "estate_type",
    tb_ads_type.type                        AS "advertisment_type",
    tb_feature_sz.total_area                AS "total_area",
    tb_feature_sz.main_area                 AS "main_area",
    tb_feature_sz.storage_area              AS "storage_area",
    tb_feature_sz.terrace_area              AS "terrace_area",
    tb_feature_sz.balcony_area              AS "balcony_area",
    tb_feature_sz.garden_area               AS "garden_area",
    tb_feature_sz.garage_area               AS "garage_area",
    tb_feature_sz.n_indoor_park             AS "indoor_park",
    tb_feature_sz.n_outdoor_park            AS "outdoor_park",
    tb_feature_floor.total_floor            AS "total_floor",
    tb_feature_floor.elevators              AS "elevators",
    tb_feature_floor.estate_floor           AS "estate_floor",
    tb_feature_floor.disabled_access        AS "disabled_acces",
    tb_feature_comp.bathrooms               AS "bathrooms",
    tb_feature_comp.kitchens                AS "kitchens",
    tb_feature_comp.liveable_kitchen        AS "liveable_kitchen",
    tb_feature_comp.bedrooms                AS "bedrooms",
    tb_furniture_type.type                  AS "furniture_type",
    tb_energy_class_type.type               AS "energy_class_type",
    tb_feature_energy_eff.epgl              AS "epgl",
    tb_heating_type.type                    AS "heating_type",
    tb_air_cond_type.type                   AS "air_cond_type",
    tb_property_type.type                   AS "property_type",
    tb_condition_type.type                  AS "condition_type",
    tb_feature_condition.construction_year  AS "construction_year",
    tb_feature_other.near_school            AS "near_school",
    tb_feature_other.near_park              AS "near_park",
    tb_feature_other.near_shopping          AS "near_shopping",
    tb_feature_other.near_transport         AS "near_transport",
    tb_feature_other.near_restaurant        AS "near_restaurant",
    tb_feature_other.near_hospital          AS "near_hospital",
    tb_feature_other.near_police            AS "near_police",
    tb_feature_other.near_fire_station      AS "near_fire_station",
    tb_feature_other.near_bank              AS "near_bank",
    tb_feature_other.near_post_office       AS "near_post_office",
    tb_feature_other.near_gas_station       AS "near_gas_station",
    tb_feature_other.near_library           AS "near_library",
    tb_feature_other.near_cinema            AS "near_cinema",
    tb_feature_other.near_theatre           AS "near_theatre",
    tb_feature_other.near_museum            AS "near_museum",
    tb_feature_other.near_zoo               AS "near_zoo",
    tb_feature_other.near_aquarium          AS "near_aquarium",
    tb_feature_other.near_gym               AS "near_gym",
    tb_feature_other.near_swimming_pool     AS "near_swimming_pool",
    tb_feature_other.near_sports_facility   AS "near_sports_facility",
    tb_feature_other.near_university        AS "near_university",
    tb_feature_other.near_kindergarten      AS "near_kindergarten",
    tb_feature_other.near_primary_school    AS "near_primary_school",
    tb_feature_other.near_secondary_school  AS "near_secondary_school",
    tb_feature_other.near_high_school       AS "near_high_school",
    tb_feature_other.lgbt_friendly          AS "lgbt_friendly",
    tb_feature_other.pet_friendly           AS "pet_friendly",
    tb_feature_other.opt_fiber_coverage     AS "opt_fiber_coverage",
    tb_price.price                          AS "price",
    tb_price.condo_fees                     AS "condo_fees",
    tb_price.income_property                AS "income_property",
    tb_price.is_free                        AS "is_free",
    tb_price.is_negotiable                  AS "is_negotiable"
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
        ON tb_feature_comp.id_type_furniture = tb_furniture_type.id
    JOIN tb_feature_energy_eff
        ON tb_estate.id = tb_feature_energy_eff.id_estate
    JOIN tb_energy_class_type
        ON tb_feature_energy_eff.id_energy_class_type = tb_energy_class_type.id
    JOIN tb_heating_type
        ON tb_feature_energy_eff.id_heating_type = tb_heating_type.id
    JOIN tb_air_cond_type
        ON tb_feature_energy_eff.id_air_cond_type = tb_air_cond_type.id
    JOIN tb_feature_condition
        ON tb_estate.id = tb_feature_condition.id_estate
    JOIN tb_property_type
        ON tb_feature_condition.id_property_type = tb_property_type.id
    JOIN tb_condition_type
        ON tb_feature_condition.id_condition_type = tb_condition_type.id
    JOIN tb_feature_other
        ON tb_estate.id = tb_feature_other.id_estate
    JOIN tb_price
        ON tb_estate.id = tb_price.id_estate;




CREATE VIEW vw_estate_rent AS
SELECT
    tb_estate.id                            AS "id",
    tb_estate.time_stamp                    AS "time_stamp",
    tb_estate.is_sold                       AS "is_sold",
    tb_estate_type.type                     AS "estate_type",
    tb_ads_type.type                        AS "advertisment_type",
    tb_feature_sz.total_area                AS "total_area",
    tb_feature_sz.main_area                 AS "main_area",
    tb_feature_sz.storage_area              AS "storage_area",
    tb_feature_sz.terrace_area              AS "terrace_area",
    tb_feature_sz.balcony_area              AS "balcony_area",
    tb_feature_sz.garden_area               AS "garden_area",
    tb_feature_sz.garage_area               AS "garage_area",
    tb_feature_sz.n_indoor_park             AS "indoor_park",
    tb_feature_sz.n_outdoor_park            AS "outdoor_park",
    tb_feature_floor.total_floor            AS "total_floor",
    tb_feature_floor.elevators              AS "elevators",
    tb_feature_floor.estate_floor           AS "estate_floor",
    tb_feature_floor.disabled_access        AS "disabled_acces",
    tb_feature_comp.bathrooms               AS "bathrooms",
    tb_feature_comp.kitchens                AS "kitchens",
    tb_feature_comp.liveable_kitchen        AS "liveable_kitchen",
    tb_feature_comp.bedrooms                AS "bedrooms",
    tb_furniture_type.type                  AS "furniture_type",
    tb_energy_class_type.type               AS "energy_class_type",
    tb_feature_energy_eff.epgl              AS "epgl",
    tb_heating_type.type                    AS "heating_type",
    tb_air_cond_type.type                   AS "air_cond_type",
    tb_property_type.type                   AS "property_type",
    tb_condition_type.type                  AS "condition_type",
    tb_feature_condition.construction_year  AS "construction_year",
    tb_feature_other.near_school            AS "near_school",
    tb_feature_other.near_park              AS "near_park",
    tb_feature_other.near_shopping          AS "near_shopping",
    tb_feature_other.near_transport         AS "near_transport",
    tb_feature_other.near_restaurant        AS "near_restaurant",
    tb_feature_other.near_hospital          AS "near_hospital",
    tb_feature_other.near_police            AS "near_police",
    tb_feature_other.near_fire_station      AS "near_fire_station",
    tb_feature_other.near_bank              AS "near_bank",
    tb_feature_other.near_post_office       AS "near_post_office",
    tb_feature_other.near_gas_station       AS "near_gas_station",
    tb_feature_other.near_library           AS "near_library",
    tb_feature_other.near_cinema            AS "near_cinema",
    tb_feature_other.near_theatre           AS "near_theatre",
    tb_feature_other.near_museum            AS "near_museum",
    tb_feature_other.near_zoo               AS "near_zoo",
    tb_feature_other.near_aquarium          AS "near_aquarium",
    tb_feature_other.near_gym               AS "near_gym",
    tb_feature_other.near_swimming_pool     AS "near_swimming_pool",
    tb_feature_other.near_sports_facility   AS "near_sports_facility",
    tb_feature_other.near_university        AS "near_university",
    tb_feature_other.near_kindergarten      AS "near_kindergarten",
    tb_feature_other.near_primary_school    AS "near_primary_school",
    tb_feature_other.near_secondary_school  AS "near_secondary_school",
    tb_feature_other.near_high_school       AS "near_high_school",
    tb_feature_other.lgbt_friendly          AS "lgbt_friendly",
    tb_feature_other.pet_friendly           AS "pet_friendly",
    tb_feature_other.opt_fiber_coverage     AS "opt_fiber_coverage",
    tb_price.price                          AS "price",
    tb_price.condo_fees                     AS "condo_fees",
    tb_price.income_property                AS "income_property",
    tb_price.is_free                        AS "is_free",
    tb_price.is_negotiable                  AS "is_negotiable",
    tb_rental_contract_type.type            AS "rental_contract_type",
    tb_rental_info.rent_to_own              AS "rent_to_own",
    tb_rental_info.roommates                AS "roommates",
    tb_rental_utilities_type.type           AS "rental_utilities_type"
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
        ON tb_feature_comp.id_type_furniture = tb_furniture_type.id
    JOIN tb_feature_energy_eff
        ON tb_estate.id = tb_feature_energy_eff.id_estate
    JOIN tb_energy_class_type
        ON tb_feature_energy_eff.id_energy_class_type = tb_energy_class_type.id
    JOIN tb_heating_type
        ON tb_feature_energy_eff.id_heating_type = tb_heating_type.id
    JOIN tb_air_cond_type
        ON tb_feature_energy_eff.id_air_cond_type = tb_air_cond_type.id
    JOIN tb_feature_condition
        ON tb_estate.id = tb_feature_condition.id_estate
    JOIN tb_property_type
        ON tb_feature_condition.id_property_type = tb_property_type.id
    JOIN tb_condition_type
        ON tb_feature_condition.id_condition_type = tb_condition_type.id
    JOIN tb_feature_other
        ON tb_estate.id = tb_feature_other.id_estate
    JOIN tb_price
        ON tb_estate.id = tb_price.id_estate
    JOIN tb_rental_info
        ON tb_estate.id = tb_rental_info.id_estate
    JOIN tb_rental_contract_type
        ON tb_rental_info.id_rental_contract_type = tb_rental_contract_type.id
    JOIN tb_rental_utilities_type
        ON tb_rental_info.id_rental_utilities_type = tb_rental_utilities_type.id;


