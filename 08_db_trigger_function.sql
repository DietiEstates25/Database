/*
 ? should we have one trigger per procedure or one trigger per table 
 ? executing all procedures?
*/
/******************************************************************************
 * TYPE: function - trigger
 * NAME: bss_hierarchy_check

 * DESC: check if the role hierarchy is consistent (subordinate roles must be
         lower in hierarchy than superior roles and root roles must have no
         superiors)
 *****************************************************************************/
CREATE OR REPLACE FUNCTION bss_hierarchy_check()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
DECLARE
    sup_role  dm_int0plus;
BEGIN
    IF NEW.id_super IS NULL THEN
        IF EXISTS (
            SELECT 1
            FROM tb_bss_role
            WHERE hierarchy > NEW.id_role
        ) THEN
            -- ? what should i raise here?
            call raise_custom_error('bss_hierarchy_violation');
        END IF;
    ELSE
        SELECT id_role INTO sup_role
        FROM tb_bss_usr
        WHERE id_email = NEW.id_super;

        IF sup_role <= NEW.id_role THEN
            -- ? what should i raise here?
            call raise_custom_error('bss_hierarchy_violation');
        END IF;
    END IF;
END;
$$;

/******************************************************************************
 * TYPE: trigger
 * NAME: trg_bss_usr_hierarchy
 *
 * DESC: trigger to check if the role hierarchy is consistent
 *****************************************************************************/
CREATE TRIGGER trg_bss_usr_hierarchy
    BEFORE INSERT OR UPDATE
    ON tb_tmp_bss_usr
    FOR EACH ROW
    EXECUTE FUNCTION bss_hierarchy_check();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: function - trigger
 * NAME: unique_root_per_agency

 * DESC: prevent multiple root roles per agency
 *****************************************************************************/
CREATE OR REPLACE FUNCTION unique_root_per_agency()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.id_super IS NULL AND EXISTS (
            SELECT 1
            FROM tb_bss_usr
            WHERE id_agency = NEW.id_agency
            AND id_super IS NULL
        ) THEN
        -- ? what should i raise here?
        call raise_custom_error('bss_multiple_root_violation');
    END IF;
END;
$$;

/******************************************************************************
 * TYPE: trigger
 * NAME: trg_bss_usr_root
 *
 * DESC: trigger to prevent multiple root roles per agency
 *****************************************************************************/
CREATE TRIGGER trg_bss_usr_root
    BEFORE INSERT OR UPDATE
    ON tb_tmp_bss_usr
    FOR EACH ROW
    EXECUTE FUNCTION unique_root_per_agency();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: function - trigger
 * NAME: bss_usr_agency_consistency

 * DESC: check if the agency of the user is consistent with the agency of the
         superior role
 *****************************************************************************/
CREATE OR REPLACE FUNCTION bss_usr_agency_consistency()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
DECLARE
    sup_agency  dm_int0plus;
BEGIN
    IF NEW.id_super IS NOT NULL THEN
        SELECT id_agency INTO sup_agency
        FROM tb_bss_usr
        WHERE id_email = NEW.id_super;

        IF sup_agency <> NEW.id_agency THEN
            -- ? what should i raise here?
            call raise_custom_error('bss_agency_violation');
        END IF;
    END IF;
END;
$$;

/******************************************************************************
 * TYPE: trigger
 * NAME: trg_bss_usr_agency
 *
 * DESC: trigger to check if the agency of the user is consistent with the
         agency of the superior role
 *****************************************************************************/
CREATE TRIGGER trg_bss_usr_agency
    BEFORE INSERT OR UPDATE
    ON tb_tmp_bss_usr
    FOR EACH ROW
    EXECUTE FUNCTION bss_usr_agency_consistency();
------------------------------------------------------------------------------- 

/******************************************************************************
 * TYPE: function - trigger
 * NAME: rental_info_only_if_rental

 * DESC: check if the rental information is only filled if the property is
         available for rent
 *****************************************************************************/
CREATE OR REPLACE FUNCTION rental_info_only_if_rental()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- ! not sure about this check, probably is optimizable.
    IF NOT EXISTS (
        SELECT 1
        FROM tb_ads_type JOIN tb_estate
        ON tb_ads_type.id = tb_estate.id_ads_type
        WHERE type = 'rental' AND id_estate = NEW.id_estate
    ) THEN
        -- ? what should i raise here?
        call raise_custom_error('rental_info_only_if_rental');
    END IF;

    /*
      * Probably if we partition on ads_type we can exploit indexes at their
      * best with this code below:
    */

    /*
        SELECT id INTO var_ads_type
        FROM tb_ads_type
        WHERE type = 'rental';

        IF NOT EXISTS (
            SELECT 1
            FROM tb_estate
            WHERE id_ads_type = var_ads_type
            AND id_estate = NEW.id_estate
        ) THEN
            call raise_custom_error('rental_info_only_if_rental');
        END IF;
    */

    /*
     * I think that this way is easier for postgres to optimize the query
     * going through the indexes initially and then checking the existence
     * of the estate only in the partitio of estates that are rentals
    */
END;
$$;