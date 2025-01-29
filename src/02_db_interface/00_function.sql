CREATE OR REPLACE FUNCTION fn_new_tmp_bss_user(
    new_email       dm_email,
    new_role        dm_smp_str,    
    email_creator   dm_email
)
RETURNS integer
LANGUAGE plpgsql
AS $$
    DECLARE
        creator_id          integer;
        creator_usr_type_id integer;
        agency_id           integer;
        new_role_id         integer;
        new_usr_id          integer;
    BEGIN
        SELECT tb_usr.id, tb_usr.id_usr_type
        INTO STRICT creator_id, creator_usr_type_id
        FROM tb_usr
        WHERE tb_usr.email = email_creator AND tb_usr.is_bss;

        SELECT tb_usr_type.id
        INTO STRICT new_role_id
        FROM tb_usr_type
        WHERE tb_usr_type.type = new_role AND tb_usr_type.is_bss;

        IF (creator_record.id_usr_type >= new_role_id) THEN
           SELECT raise_custom_error('bss_hierarchy_violation');
        END IF;
    
        SELECT tb_bss_usr.id_agency
        INTO STRICT agency_id
        FROM tb_bss_usr
        WHERE tb_bss_usr.id_usr = creator_id;

        -- ? maybe a check if already exists as end_usr, maybe upsert?
        INSERT INTO tb_usr(
            email,
            id_usr_type,
            is_bss
        )
        VALUES (
            new_email,
            new_role_id,
            true 
        )
        RETURNING id INTO new_usr_id;
        /*ON CONFLICT (email) DO UPDATE
        SET id_usr_type = EXCLUDED.id_usr_type, is_bss = true
        WHERE tb_usr.id_usr_type = ( 
            SELECT id
            FROM tb_usr_type
            WHERE type = 'USER'
        );
        */

        INSERT INTO tb_tmp_bss_usr(
            id_usr,
            id_super,
            id_agency
        )
        VALUES (
            new_usr_id,
            creator_id,
            agency_id
        );

        RETURN (new_usr_id);

    END;
$$;



CREATE OR REPLACE FUNCTION fn_new_bss_usr(
    id_bss_usr integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
    DECLARE
        super_id    integer;
        agency_id   integer;
        ctrl        integer;
    BEGIN
        SELECT 1
        INTO STRICT ctrl
        FROM tb_usr_data
        WHERE tb_usr_data.id_usr = id_bss_usr;

        SELECT 1
        INTO STRICT ctrl
        FROM tb_phone
        WHERE tb_phone.id_usr = id_bss_usr;

        SELECT tb_bss_usr.id_super, tb_bss_usr.id_agency
        INTO STRICT super_id, agency_id
        FROM tb_tmp_bss_usr
        WHERE tb_tmp_bss_usr.id_usr = id_bss_usr;

        INSERT INTO tb_bss_usr(
            id_usr,
            id_super,
            id_agency 
        )
        VALUES (
            id_bss_usr,
            super_id,
            agency_id
        );
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            SELECT raise_custom_error('bss_usr_not_found');
    END;
$$;


CREATE OR REPLACE FUNCTION fn_validate_tmp_estate(
    id_tmp_estate   integer
)
RETURNS boolean
LANGUAGE plpgsql
AS $$
    DECLARE
        is_rent boolean := false;
        ctrl    integer;
    BEGIN
         
        SELECT 1
        INTO STRICT ctrl
        FROM tb_tmp_estate
        WHERE tb_tmp_estate.id = id_tmp_estate;
        
        SELECT 1
        INTO STRICT ctrl
        FROM tb_tmp_feature_sz
        WHERE tb_tmp_feature_sz.id_estate = id_tmp_estate;

        SELECT 1
        INTO STRICT ctrl
        FROM tb_tmp_feature_floor
        WHERE tb_tmp_feature_floor.id_estate = id_tmp_estate;

        SELECT 1
        INTO STRICT ctrl
        FROM tb_tmp_feature_comp
        WHERE tb_tmp_feature_comp.id_estate = id_tmp_estate;

        SELECT 1
        INTO STRICT ctrl
        FROM tb_tmp_feature_energy_eff
        WHERE tb_tmp_feature_energy_eff.id_estate = id_tmp_estate;

        SELECT 1
        INTO STRICT ctrl
        FROM tb_tmp_feature_condition
        WHERE tb_tmp_feature_.id_estate = id_tmp_estate;

        SELECT 1
        INTO STRICT ctrl
        FROM tb_tmp_feature_other
        WHERE tb_tmp_feature_other.id_estate = id_tmp_estate;

        SELECT 1
        INTO STRICT ctrl
        FROM tb_tmp_price
        WHERE tb_tmp_price.id_estate = id_tmp_estate;

        SELECT (tb_ads_type.type = 'RENT')
        INTO is_rent
        FROM tb_tmp_estate JOIN tb_ads_type
            ON tb_tmp_estate.id_ads_type = tb_ads_type.id
        WHERE tb_tmp_estate.id = id_tmp_estate;

        IF (is_rent) THEN
            SELECT 1
            INTO STRICT ctrl
            FROM tb_tmp_rental_info
            WHERE tb_tmp_rental_info.id_estate = id_tmp_estate;
        END IF;

        RETURN (is_rent);

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            SELECT raise_custom_error('tmp_estate_not_found');

    END;
$$;


CREATE OR REPLACE FUNCTION fn_new_feature_sz(
    id_tmp_estate   integer,
    new_id          integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
    DECLARE

    BEGIN

        INSERT INTO tb_feature_sz(
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
        SELECT
            new_id,
            tb_tmp_feature_sz.main_area,
            tb_tmp_feature_sz.storage_area,
            tb_tmp_feature_sz.terrace_area,
            tb_tmp_feature_sz.balcony_area,
            tb_tmp_feature_sz.garden_area,
            tb_tmp_feature_sz.garage_area,
            tb_tmp_feature_sz.n_indoor_park, 
            tb_tmp_feature_sz.n_outdoor_park
        FROM
            tb_tmp_feature_sz
        WHERE
            tb_tmp_feature_sz.id_estate = id_tmp_estate;

    END;
$$;


CREATE OR REPLACE FUNCTION fn_new_feature_floor(
    id_tmp_estate   integer,
    new_id          integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
    DECLARE

    BEGIN

        INSERT INTO tb_feature_floor(
            id_estate,
            total_floor,
            elevators,
            estate_floor,
            disabled_access
        )
        SELECT
            new_id,
            tb_tmp_feature_floor.total_floor,
            tb_tmp_feature_floor.elevators,
            tb_tmp_feature_floor.estate_floor,
            tb_tmp_feature_floor.disabled_access
        FROM
            tb_tmp_feature_floor
        WHERE
            tb_tmp_feature_floor.id_estate = id_tmp_estate;
           
    END;
$$;


CREATE OR REPLACE FUNCTION fn_new_feature_comp(
    id_tmp_estate   integer,
    new_id          integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
    DECLARE

    BEGIN

        INSERT INTO tb_feature_comp(
            id_estate,
            rooms,
            bathrooms,
            kitchens,
            liveable_kitchen,
            bedrooms,
            id_type_furniture
        )
        SELECT
            new_id,
            tb_tmp_feature_comp.rooms,
            tb_tmp_feature_comp.bathrooms,
            tb_tmp_feature_comp.kitchens,
            tb_tmp_feature_comp.liveable_kitchen,
            tb_tmp_feature_comp.bedrooms,
            tb_tmp_feature_comp.id_type_furniture
        FROM
            tb_tmp_feature_comp
        WHERE
            tb_tmp_feature_comp.id_estate = id_tmp_estate;
           
    END;
$$;



CREATE OR REPLACE FUNCTION fn_new_feature_energy_eff(
    id_tmp_estate   integer,
    new_id          integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
    DECLARE

    BEGIN

        INSERT INTO tb_feature_energy_eff(
            id_estate,
            id_energy_class_type,
            epgl,
            id_heating_type,
            id_air_cond_type
        )
        SELECT
            new_id,
            tb_tmp_feature_energy_eff.id_energy_class_type,
            tb_tmp_feature_energy_eff.epgl,
            tb_tmp_feature_energy_eff.id_heating_type,
            tb_tmp_feature_energy_eff.id_air_cond_type
        FROM
            tb_tmp_feature_energy_eff
        WHERE
            tb_tmp_feature_energy_eff.id_estate = id_tmp_estate;
           
    END;
$$;


CREATE OR REPLACE FUNCTION fn_new_feature_condition(
    id_tmp_estate   integer,
    new_id          integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
    DECLARE

    BEGIN

        INSERT INTO tb_feature_condition(
            id_estate,
            id_property_type,
            id_condition_type,
            construction_year
        )
        SELECT
            new_id,
            tb_tmp_feature_condition.id_property_type,
            tb_tmp_feature_condition.id_condition_type,
            tb_tmp_feature_condition.construction_year
        FROM
            tb_tmp_feature_condition
        WHERE
            tb_tmp_feature_condition.id_estate = id_tmp_estate;
           
    END;
$$;


CREATE OR REPLACE FUNCTION fn_new_feature_other(
    id_tmp_estate   integer,
    new_id          integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
    DECLARE

    BEGIN

        INSERT INTO tb_feature_other(
            id_estate,
            near_school,
            near_kindergarten,
            near_university,
            near_park,
            near_shopping,
            near_market,
            near_transport,
            near_subway,
            near_catering,
            near_healthcare,
            near_laisure,
            near_nature,
            near_office,
            near_parking,
            near_railway,
            near_airpoty,
            near_service,
            near_beach,
            near_adult,
            near_heritage,
            near_entertainment,
            near_sport,
            populated_area,
            low_emission_zone,
            lgbt_friendly,
            pet_friendly,
            opt_fiber_coverage
        )
        SELECT
            new_id,
            tb_tmp_feature_other.near_school,
            tb_tmp_feature_other.near_kindergarten,
            tb_tmp_feature_other.near_university,
            tb_tmp_feature_other.near_park,
            tb_tmp_feature_other.near_shopping,
            tb_tmp_feature_other.near_market,
            tb_tmp_feature_other.near_transport,
            tb_tmp_feature_other.near_subway,
            tb_tmp_feature_other.near_catering,
            tb_tmp_feature_other.near_healthcare,
            tb_tmp_feature_other.near_laisure,
            tb_tmp_feature_other.near_nature,
            tb_tmp_feature_other.near_office,
            tb_tmp_feature_other.near_parking,
            tb_tmp_feature_other.near_railway,
            tb_tmp_feature_other.near_airpoty,
            tb_tmp_feature_other.near_service,
            tb_tmp_feature_other.near_beach,
            tb_tmp_feature_other.near_adult,
            tb_tmp_feature_other.near_heritage,
            tb_tmp_feature_other.near_entertainment,
            tb_tmp_feature_other.near_sport,
            tb_tmp_feature_other.populated_area,
            tb_tmp_feature_other.low_emission_zone,
            tb_tmp_feature_other.lgbt_friendly,
            tb_tmp_feature_other.pet_friendly,
            tb_tmp_feature_other.opt_fiber_coverage
        FROM
            tb_tmp_feature_other
        WHERE
            tb_tmp_feature_other.id_estate = id_tmp_estate;
           
    END;
$$;



CREATE OR REPLACE FUNCTION fn_new_price(
    id_tmp_estate   integer,
    new_id          integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
    DECLARE

    BEGIN

        INSERT INTO tb_price(
            id_estate,
            price,
            condo_fees,
            income_property,
            is_free,
            is_negotiable
        )
        SELECT
            new_id,
            tb_tmp_price.price,
            tb_tmp_price.condo_fees,
            tb_tmp_price.income_property,
            tb_tmp_price.is_free,
            tb_tmp_price.is_negotiable
        FROM
            tb_tmp_price
        WHERE
            tb_tmp_price.id_estate = id_tmp_estate;
           
    END;
$$;


CREATE OR REPLACE FUNCTION fn_new_rental_info(
    id_tmp_estate   integer,
    new_id          integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
    DECLARE

    BEGIN

        INSERT INTO tb_rental_info(
            id_estate,
            id_rental_contract_type,
            rent_to_own,
            roommates,
            id_rental_utilities_type
        )
        SELECT
            new_id,
            tb_tmp_rental_info.id_rental_contract_type,
            tb_tmp_rental_info.rent_to_own,
            tb_tmp_rental_info.roommates,
            tb_tmp_rental_info.id_rental_utilities_type
        FROM
            tb_tmp_rental_info
        WHERE
            tb_tmp_rental_info.id_estate = id_tmp_estate;
           
    END;
$$;


CREATE OR REPLACE FUNCTION fn_new_estate(id_tmp_estate integer)
RETURNS void
LANGUAGE plpgsql
AS $$
    DECLARE
        is_rent     boolean;
        id_estate   integer;
    BEGIN
        is_rent := fn_validate_tmp_estate(id_tmp_estate);

        INSERT INTO tb_estate(
            id_bss_usr,
            id_estate_type,
            id_address,
            id_ads_type
        )
        SELECT
            tb_tmp_estate.id_bss_usr,
            tb_tmp_estate.id_estate_type,
            tb_tmp_estate.id_address,
            tb_tmp_estate.id_ads_type
        FROM
            tb_tmp_estate
        WHERE
            tb_tmp_estate.id_estate = id_tmp_estate
        RETURNING
            id
        INTO
            id_estate;

        SELECT fn_new_feature_sz(id_tmp_estate, id_estate);
        SELECT fn_new_feature_floor(id_tmp_estate, id_estate);
        SELECT fn_new_feature_comp(id_tmp_estate, id_estate);
        SELECT fn_new_feature_energy_eff(id_tmp_estate, id_estate);
        SELECT fn_new_feature_condition(id_tmp_estate, id_estate);
        SELECT fn_new_feature_other(id_tmp_estate, id_estate);
        SELECT fn_new_feature_price(id_tmp_estate, id_estate);
        IF (is_rent) THEN
            SELECT fn_new_feature_rental_info(id_tmp_estate, id_estate);
        END IF;
            
    END;
$$;
