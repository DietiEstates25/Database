/******************************************************************************
 * TYPE: index
 * NAME: idx_estate_on_bss_usr
 *
 * DESC: index for the id_bss_usr column in the estate table
 *****************************************************************************/
CREATE INDEX idx_estate_on_bss_usr
    ON tb_estate(id_bss_usr);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_estate_on_agency
 *
 * DESC: index for the id_agency column in the estate table
 *****************************************************************************/
CREATE INDEX idx_estate_on_agency
    ON tb_estate(id_agency);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_estate_on_is_available
 *
 * DESC: index for the is_available column in the estate table
 *****************************************************************************/
CREATE INDEX idx_estate_on_is_available
    ON tb_estate(is_available);
-------------------------------------------------------------------------------
