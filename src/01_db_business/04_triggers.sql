
/******************************************************************************
 * TYPE: trigger
 * NAME: tg_bss_usr_root
 *
 * DESC: trigger to prevent multiple root roles per agency
 *****************************************************************************/
CREATE TRIGGER tg_bss_usr_root
    BEFORE INSERT OR UPDATE
    ON tb_tmp_bss_usr
    FOR EACH ROW
    EXECUTE FUNCTION tf_unique_root_per_agency();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_bss_usr_agency
 *
 * DESC: trigger to check if the agency of the user is consistent with the
         agency of the superior role
 *****************************************************************************/
CREATE TRIGGER tg_bss_usr_agency
    BEFORE INSERT OR UPDATE
    ON tb_tmp_bss_usr
    FOR EACH ROW
    EXECUTE FUNCTION tf_bss_usr_agency_consistency();
------------------------------------------------------------------------------- 

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_rental_info_only_if_rental
 *
 * DESC: trigger to check if the rental information is consistent with the
 *       property type
 *****************************************************************************/
CREATE TRIGGER rental_info_only_if_rental
    BEFORE INSERT OR UPDATE
    ON tb_tmp_rental_info
    FOR EACH ROW
    EXECUTE FUNCTION tf_rental_info_only_if_rental();
------------------------------------------------------------------------------- 
