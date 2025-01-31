/******************************************************************************
 * TYPE: table
 * NAME: tb_estate
 *
 * DESC: main table storing real estate property listings
 *****************************************************************************/
CREATE TABLE tb_estate (
    id              serial PRIMARY KEY,
    id_bss_usr      integer NOT NULL,
    id_agency       integer NOT NULL,
    is_available    boolean NOT NULL DEFAULT true,
    creation        timestamp NOT NULL DEFAULT NOW()
);
-------------------------------------------------------------------------------
