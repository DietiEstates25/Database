/*
 ? should we have one trigger per procedure or one trigger per table 
 ? executing all procedures?
*/
/******************************************************************************
 * TYPE: function - trigger
 * NAME: hierarchy_check
 *
 * DESC: check if the role hierarchy is consistent (subordinate roles must be
         lower in hierarchy than superior roles)
 *****************************************************************************/
CREATE OR REPLACE FUNCTION hierarchy_check()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
DECLARE
    var_role   dm_int0plus;
BEGIN
    SELECT id_role INTO var_role
    FROM tb_tmp_bss_usr
    WHERE id_super = NEW.id_super;

    IF var_role <= NEW.id_role THEN
        call raise_custom_error('bss_hierarchy_violatio');
    END IF;

    RETURN NEW;

END;
$$;

-- TEST

CREATE OR REPLACE FUNCTION test()
    RETURNS TRIGGER
    LANGUAGE plpgsql
    AS $$
BEGIN
    call raise_custom_error('aaaa');
    RETURN NEW;
END;
$$;

CREATE TRIGGER test_t
    BEFORE INSERT ON tb_email
    FOR EACH ROW
    EXECUTE FUNCTION test();
