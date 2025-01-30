/******************************************************************************
 * TYPE: table
 * NAME: tb_address
 *
 * DESC: table storing geographical location and address details for properties
 *****************************************************************************/
CREATE TABLE tb_address (
    id              serial PRIMARY KEY,
    street          text NOT NULL,
    st_number       text NOT NULL,
    neighborhood    text NOT NULL,
    city            text NOT NULL,
    state_province  text NOT NULL,
    postal_code     text NOT NULL,
    country         text NOT NULL,
    latitude        decimal(10,8) NOT NULL,
    longitude       decimal(11,8) NOT NULL
--    coordinate      geometry(Point, 4326) NOT NULL
);
-------------------------------------------------------------------------------
