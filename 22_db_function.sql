CREATE OR REPLACE FUNCTION fn_new_tmp_bss_user(
    new_email       dm_email,
    new_role        dm_smp_str,    
    email_creator   dm_email
)
AS $$
    DECLARE
        creator_record  RECORD;
        new_role_record RECORD;
        id_new_usr      integer;

    BEGIN
        SELECT tb_usr.id, tb_usr.id_usr_type, tb_bss_usr.id_agency
        INTO creator_record
        FROM tb_usr JOIN tb_bss_usr ON tb_usr.id = tb_bss_usr.id_usr
        WHERE tb_usr.email = email_creator;

        IF (creator_record IS NULL) THEN
            -- raise exeption
            RETURN (NULL);
        END IF;

        SELECT tb_usr_type.id
        INTO new_role_id
        FROM tb_usr_type
        WHERE tb_usr_type.type = new_role AND tb_usr_type.is_bss;

        IF (new_role_id IS NULL) THEN
            -- raise exeption
            RETURN (NULL);
        END IF;

        IF (creator_record.id_usr_type >= new_role_id) THEN
           -- raise exeption 
            RETURN (NULL);
        END IF;

        INSERT INTO tb_usr(
            new_email,
            id_usr_type,
            is_bss
        )
        VALUES (
            email,
            new_role_id
            true 
        )
        RETURNING id INTO id_new_usr;

        INSERT INTO tb_tmp_bss_usr(
            id_usr,
            id_super,
            id_agency
        )
        VALUES (
            id_new_usr,
            creator_record.id,
            creator_record.id_agency 
        );

        RETURN (id_new_usr);

    END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION fn_new_bss_usr(id_bss_usr integer)
    RETURNS void
AS $$
    DECLARE
        bss_usr_record  RECORD;
    BEGIN
        SELECT tb_bss_usr.id_usr,tb_bss_usr.id_super, tb_bss_usr.id_agency
        INTO bss_usr_record
        FROM tb_tmp_bss_usr
            JOIN tb_phone ON tb_tmp_bss_usr.id_usr = tb_phone.id_usr
            JOIN tb_usr_data ON tb_tmp_bss_usr.id_usr = tb_usr_data.id_usr
        WHERE
            tb_tmp_bss_usr.id_usr = id_bss_usr;

        IF (bss_usr_record IS NULL) THEN 
            -- exeption
        END IF;

        INSERT INTO tb_bss_usr(
            id_usr,
            id_super,
            id_agency 
        )
        VALUES (
            bss_usr_record.id_usr,
            bss_usr_record.id_super,
            bss_usr_record.id_agency 
        );
    END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION fn_new_estate(id_estate integer)
    RETURNS void
AS $$
    DECLARE
        estate_record   RECORD;
        is_rent         boolean;
        rent_record     RECORD;
    BEGIN
        SELECT (a.type = 'RENT')
        INTO is_rent
        FROM tb_tmp_estate e
            JOIN tb_ads_type a ON e.id_ads_type
        WHERE
            e.id = id_estate;
            
        IF (is_rent) THEN
            SELECT *
            INTO rent_record
            FROM tb_tmp_rental_info r
            WHERE r.id_estate = id_estate;

            IF (rent_record IS NULL) THEN
                --exeption
            END IF
        END IF;

        SELECT *
        INTO estate_record
        FROM tb_tmp_estate e
            JOIN tb_tmp_feature_sz s ON e.id = s.id_estate 
            JOIN tb_tmp_feature_floor f ON e.id = f.id_estate 
            JOIN tb_tmp_feature_comp c ON e.id = c.id_estate 
            JOIN tb_tmp_feature_energy_eff ee ON e.id = ee.id_estate 
            JOIN tb_tmp_feature_condition cd ON e.id = cd.id_estate 
            JOIN tb_tmp_feature_other o ON e.id = o.id_estate 
            JOIN tb_tmp_feature_price p ON e.id = p.id_estate 
        WHERE
            e.id = id_estate;

        IF (estate_record IS NULL) THEN
            --exeption
        END IF;

        INSERT INTO tb_estate(
            id_bss_usr,
            id_estate_type,
            id_address,
            id_ads_type
        )
        VALUES (
            estate_record.id_bss_usr,
            estate_record.id_estate_type,
            estate_record.id_address,
            estate_record.id_ads_type
        )
        RETURNING id INTO id_estate;


        INSERT INTO tb_feature_sz (
            id_estate,
            main_area,
            storage_area,
            terrace_area,
            balcony_area,
            garden_area,
            garage_area,
            n_indoor_park,
            n_outdoor_park
        )
        VALUES (
            id_estate,
            estate_record.main_area,
            estate_record.storage_area,
            estate_record.terrace_area,
            estate_record.balcony_area,
            estate_record.garden_area,
            estate_record.garage_area,
            estate_record.n_indoor_park,
            estate_record.n_outdoor_park
        );

        INSERT INTO tb_feature_floor (
            id_estate,
            total_floor,
            elevators,
            estate_floor,
            disable_access
        )
        VALUES (
            id_estate,
            estate_record.total_floor,
            estate_record.elevators,
            estate_record.estate_floor,
            estate_record.disable_access
        );

        INSERT INTO tb_feature_comp (
            id_estate,
            rooms,
            bathrooms,
            kitchens,
            liveable_kitchen,
            bedrooms,
            id_type_furniture
        )
        VALUES (
            id_estate,
            estate_record.rooms,
            estate_record.bathrooms,
            estate_record.kitchens,
            estate_record.liveable_kitchen,
            estate_record.bedrooms,
            estate_record.id_type_furniture
        );

        INSERT INTO tb_feature_energy_eff (
            id_estate,
            id_energy_class_type,
            epgl,
            id_heating_type,
            id_air_cond_type
        )
        VALUES (
            id_estate,
            estate_record.id_energy_class_type,
            estate_record.epgl,
            estate_record.id_heating_type,
            estate_record.id_air_cond_type
        );

        INSERT INTO tb_feature_condition (
            id_estate,
            id_property_type,
            id_condition_type,
            construction_year
        )
        VALUES (
            id_estate,
            estate_record.id_property_type,
            estate_record.id_condition_type,
            estate_record.construction_year
        );

        INSERT INTO tb_feature_other (
            id_estate,
            near_school,
            near_park,
            near_shopping,
            near_transport,
            near_restaurant,
            near_hospital,
            near_police,
            near_fire_station,
            near_bank,
            near_post_office,
            near_gas_station,
            near_library,
            near_cinema,
            near_theatre,
            near_museum,
            near_zoo,
            near_aquarium,
            near_gym,
            near_swimming_pool,
            near_sports_facility,
            near_university,
            near_kindergarten,
            near_primary_school,
            near_secondary_school,
            near_high_school,
            lgbt_friendly,
            pet_friendly,
            opt_fiber_coverage
        )
        VALUES (
            id_estate,
            estate_record.near_school,
            estate_record.near_park,
            estate_record.near_shopping,
            estate_record.near_transport,
            estate_record.near_restaurant,
            estate_record.near_hospital,
            estate_record.near_police,
            estate_record.near_fire_station,
            estate_record.near_bank,
            estate_record.near_post_office,
            estate_record.near_gas_station,
            estate_record.near_library,
            estate_record.near_cinema,
            estate_record.near_theatre,
            estate_record.near_museum,
            estate_record.near_zoo,
            estate_record.near_aquarium,
            estate_record.near_gym,
            estate_record.near_swimming_pool,
            estate_record.near_sports_facility,
            estate_record.near_university,
            estate_record.near_kindergarten,
            estate_record.near_primary_school,
            estate_record.near_secondary_school,
            estate_record.near_high_school,
            estate_record.lgbt_friendly,
            estate_record.pet_friendly,
            estate_record.opt_fiber_coverage
        );

        INSERT INTO tb_feature_price (
            id_estate,
            price,
            income_property,
            is_free,
            is_negotiable
        )
        VALUES (
            id_estate,
            estate_record.price,
            estate_record.income_property,
            estate_record.is_free,
            estate_record.is_negotiable
        );

        IF (is_rent) THEN
            INSERT INTO tb_rental_info (
                id_estate,
                id_rental_contract_type,
                rent_to_own,
                roommates,
                id_rental_utilities_type
            )
            VALUES (
                id_estate,
                rent_record.id_rental_contract_type,
                rent_record.rent_to_own,
                rent_record.roommates,
                rent_record.id_rental_utilities_type
            );
        END IF;

    END;
$$ LANGUAGE plpgsql;


