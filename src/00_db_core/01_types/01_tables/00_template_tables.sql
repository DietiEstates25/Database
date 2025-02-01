/******************************************************************************
 * TYPE: table
 * NAME: tb_template_type
 *
 * DESC: template for a table of types
 *****************************************************************************/
CREATE TABLE tb_template_type (
    id      serial PRIMARY KEY,
    type    dm_usalnum UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - index 
 * NAME: idx_table_type
 *
 * DESC: index for table of types
 *****************************************************************************/
CREATE UNIQUE INDEX idx_table_type ON tb_template_type (type);
-------------------------------------------------------------------------------
