/******************************************************************************
 * TYPE: table
 * NAME: tb_estate
 *
 * DESC: main table storing real estate property listings
 *****************************************************************************/
CREATE TABLE tb_estate (
    id              serial PRIMARY KEY,
    is_available    boolean NOT NULL DEFAULT true
);
-------------------------------------------------------------------------------
