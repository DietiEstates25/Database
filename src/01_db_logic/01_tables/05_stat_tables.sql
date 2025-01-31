/******************************************************************************
 * TYPE: table
 * NAME: tb_estate_action
 *
 * DESC: table tracking action made on properties
 *****************************************************************************/
CREATE TABLE tb_estate_action (
    id_estate       integer NOT NULL,
    id_bss_usr      integer NOT NULL,
    id_agency       integer NOT NULL,
    time_stamp      timestamp NOT NULL DEFAULT NOW(),
    id_action_type  integer NOT NULL
);
-------------------------------------------------------------------------------
