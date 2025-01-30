/******************************************************************************
 * TYPE: constraint - unique
 * NAME: uq_id_is_bss
 *
 * DESC: unique constraint associating an id for an user type and information
 *       if it is a business type or not 
 *****************************************************************************/
ALTER TABLE tb_usr_type
    ADD CONSTRAINT uq_id_is_bss
        UNIQUE (id, is_bss);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: usr_fk_usr_type
 *
 * DESC: foreign key constraint associating an user with an user type
 *****************************************************************************/
ALTER TABLE tb_usr
    ADD CONSTRAINT usr_fk_usr_type
        FOREIGN KEY (id_usr_type, is_bss)
        REFERENCES tb_usr_type(id, is_bss)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: usr_data_fk_usr
 *
 * DESC: foreign key constraint associating each user data with an user
 *****************************************************************************/
ALTER TABLE tb_usr_data
    ADD CONSTRAINT usr_data_fk_usr
        FOREIGN KEY (id_usr)
        REFERENCES tb_usr(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: phone_fk_usr
 *
 * DESC: foreign key constraint associating each phone number with an user
 *****************************************************************************/
ALTER TABLE tb_phone
    ADD CONSTRAINT phone_fk_usr
        FOREIGN KEY (id_usr)
        REFERENCES tb_usr(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: agency_fk_address
 *
 * DESC: foreign key constraint associating each agency with it's address
 *****************************************************************************/
ALTER TABLE tb_agency
    ADD CONSTRAINT agency_fk_address
        FOREIGN KEY (id_address)
        REFERENCES tb_address(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: bss_usr_fk_usr
 *
 * DESC: foreign key constraint associating each businesses user their user
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT bss_usr_fk_usr
        FOREIGN KEY (id_usr)
        REFERENCES tb_usr(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: bss_usr_fk_super_bss_usr
 *
 * DESC: recursive foreign key constraint associating each businesses user with 
 *       their superior
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT bss_usr_fk_super_bss_usr
        FOREIGN KEY (id_super)
        REFERENCES tb_bss_usr(id_usr)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: bss_usr_fk_agency
 *
 * DESC: foreign key constraint for tb_bss_usr to tb_agency
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT bss_usr_fk_agency
        FOREIGN KEY (id_agency)
        REFERENCES tb_agency(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_bss_usr_fk_usr
 *
 * DESC: foreign key constraint associating each temporary businesses user with 
 *       their usr
 *****************************************************************************/
ALTER TABLE tb_tmp_bss_usr
    ADD CONSTRAINT tmp_bss_usr_fk_usr
        FOREIGN KEY (id_usr)
        REFERENCES tb_usr(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_bss_usr_fk_super_bss_usr
 *
 * DESC: foreign key constraint associating each temporary businesses user with 
 *       their superior
 *****************************************************************************/
ALTER TABLE tb_tmp_bss_usr
    ADD CONSTRAINT tmp_bss_usr_fk_bss_usr
        FOREIGN KEY (id_super)
        REFERENCES tb_bss_usr(id_usr)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: tmp_bss_usr_fk_agency
 *
 * DESC: foreign key constraint associating each temporary businesses user with 
 *       their agency
 *****************************************************************************/
ALTER TABLE tb_tmp_bss_usr
    ADD CONSTRAINT tmp_bss_usr_fk_agency
        FOREIGN KEY (id_agency)
        REFERENCES tb_agency(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------
