/******************************************************************************
 * TYPE: table
 * NAME: tb_usr_type
 *
 * DESC: table defining user types and hierarchy
 *****************************************************************************/
CREATE TABLE tb_usr_type (LIKE tb_template_type INCLUDING ALL);

ALTER TABLE tb_usr_type
    ADD COLUMN is_bss boolean NOT NULL;
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: constraint - index 
 * NAME: ix_usr_type_is_bss
 *
 * DESC: index for business or not business users
 *****************************************************************************/
CREATE INDEX ix_usr_type_is_bss ON tb_usr_type (is_bss);
-------------------------------------------------------------------------------
