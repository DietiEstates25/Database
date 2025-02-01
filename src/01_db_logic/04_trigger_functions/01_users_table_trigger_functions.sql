/******************************************************************************
 * TYPE: function - trigger
 * NAME: tf_unique_root_per_agency
 *
 * DESC: prevent multiple root roles per agency
 *****************************************************************************/
CREATE OR REPLACE FUNCTION tf_unique_root_per_agency()
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
            CALL raise_custom_error('bss_multiple_root_violation');
        END IF;
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: function - trigger
 * NAME: tf_bss_usr_agency_consistency
 *
 * DESC: check if the agency of the user is consistent with the agency of the
 *       superior role
 *****************************************************************************/
CREATE OR REPLACE FUNCTION tf_bss_usr_agency_consistency()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
    DECLARE
        sup_agency  dm_int0plus;
    BEGIN
        IF NEW.id_super IS NOT NULL THEN
            SELECT id_agency
            INTO sup_agency
            FROM tb_bss_usr
            WHERE id_email = NEW.id_super;

            IF sup_agency <> NEW.id_agency THEN
                CALL raise_custom_error('bss_agency_violation');
            END IF;
        END IF;
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: function - trigger
 * NAME: tf_rental_info_only_if_rental
 *
 * DESC: check if the rental information is only filled if the property is
 *       available for rent
 *****************************************************************************/
CREATE OR REPLACE FUNCTION tf_rental_info_only_if_rental()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
    BEGIN
        
        IF NOT EXISTS (
            SELECT 1
            FROM tb_ads_type JOIN tb_estate
                ON tb_ads_type.id = tb_estate.id_ads_type
            WHERE type = 'rental'
                AND id_estate = NEW.id_estate
        ) THEN
            CALL raise_custom_error('rental_violation');
        END IF;

    END;
$$;
-------------------------------------------------------------------------------
