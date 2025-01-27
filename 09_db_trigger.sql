
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
 * TYPE: trigger
 * NAME: trg_bss_usr_root
 *
 * DESC: trigger to prevent multiple root roles per agency
 *****************************************************************************/
CREATE TRIGGER trg_bss_usr_root
    BEFORE INSERT OR UPDATE
    ON tb_tmp_bss_usr
    FOR EACH ROW
    EXECUTE FUNCTION tf_unique_root_per_agency();
-------------------------------------------------------------------------------

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
    EXECUTE FUNCTION tf_bss_usr_agency_consistency();
------------------------------------------------------------------------------- 

/******************************************************************************
 * TYPE: trigger
 * NAME: trg_rental_info_only_if_rental
 *
 * DESC: trigger to check if the rental information is consistent with the
         property type
 *****************************************************************************/
CREATE TRIGGER rental_info_only_if_rental
    BEFORE INSERT OR UPDATE
    ON tb_tmp_property
    FOR EACH ROW
    EXECUTE FUNCTION tf_rental_info_only_if_rental();
