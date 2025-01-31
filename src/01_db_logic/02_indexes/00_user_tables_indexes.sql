/******************************************************************************
 * TYPE: index
 * NAME: idx_bss_usr_on_super
 *
 * DESC: index for the id_super column in the bss_usr table
 *****************************************************************************/
CREATE INDEX idx_bss_usr_on_super
    ON tb_bss_usr(id_super);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_bss_usr_on_agency
 *
 * DESC: index for the id_agency column in the bss_usr table
 *****************************************************************************/
CREATE INDEX idx_bss_usr_on_agency
    ON tb_bss_usr(id_agency);
-------------------------------------------------------------------------------
