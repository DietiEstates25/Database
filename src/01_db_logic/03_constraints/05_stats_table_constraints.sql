/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: estate_action_fk_estate
 *
 * DESC: foreign key constraint associating the action stats with the estate
 *****************************************************************************/
ALTER TABLE tb_estate_action
    ADD CONSTRAINT estate_action_fk_usr
        FOREIGN KEY (id_estate, id_bss_usr, id_agency)
        REFERENCES tb_estate(id, id_bss_usr, id_agency)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------
