/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: estate_fk_bss_usr
 *
 * DESC: foreign key constraint associating each estate with the businesses 
 *       user (and its agency) that created it
 *****************************************************************************/
ALTER TABLE tb_estate
    ADD CONSTRAINT estate_fk_bss_usr
        FOREIGN KEY (id_bss_usr, id_agency)
        REFERENCES tb_bss_usr(id_usr, id_agency)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: constraint - unique
 * NAME: uq_estate
 *
 * DESC: unique constraint for estate (needed for referencing)
 *****************************************************************************/
ALTER TABLE tb_estate
    ADD CONSTRAINT uq_estate
        UNIQUE (id, id_bss_usr, id_agency);
-------------------------------------------------------------------------------


