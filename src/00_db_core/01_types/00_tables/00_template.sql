/******************************************************************************
 * TYPE: table
 * NAME: tb_template_type
 *
 * DESC: template for a table of types
 *****************************************************************************/
CREATE TABLE tb_template_type (
    id      serial PRIMARY KEY,
    type    text UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - index 
 * NAME: ix_table_type
 *
 * DESC: index for table of types
 *****************************************************************************/
CREATE UNIQUE INDEX ix_table_type ON tb_template_type (type);
-------------------------------------------------------------------------------
