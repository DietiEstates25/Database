/******************************************************************************
 * TYPE: constraint - primary key
 * NAME: pk_usr_action
 *
 * DESC: primary key constraint for the action stats associated with the usr
 *****************************************************************************/
ALTER TABLE tb_usr_action
    ADD CONSTRAINT pk_usr_action
        PRIMARY KEY (id_usr, id_estate);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: usr_action_fk_usr
 *
 * DESC: foreign key constraint associating the action stats with the user
 *****************************************************************************/
ALTER TABLE tb_usr_action
    ADD CONSTRAINT usr_action_fk_usr
        FOREIGN KEY (id_usr)
        REFERENCES tb_usr(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: usr_action_fk_estate
 *
 * DESC: foreign key constraint associating the action stats, associated with 
 *       the user, with the estate
 *****************************************************************************/
ALTER TABLE tb_usr_action
    ADD CONSTRAINT usr_action_fk_estate
        FOREIGN KEY (id_estate)
        REFERENCES tb_estate(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: usr_action_fk_action
 *
 * DESC: foreign key constraint associating the action stats, associated with 
 *       the usr, with the action
 *****************************************************************************/
ALTER TABLE tb_usr_action
    ADD CONSTRAINT usr_action_fk_action
        FOREIGN KEY (id_action_type)
        REFERENCES tb_action_type(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------
