/******************************************************************************
 * TYPE: table
 * NAME: tb_email_action
 *
 * DESC: table tracking action made by users on properties
 *****************************************************************************/
CREATE TABLE tb_usr_action (
    id_usr      integer NOT NULL,
    id_estate   integer NOT NULL,
    time_stamp  timestamp NOT NULL DEFAULT NOW(),
    id_action   integer NOT NULL
);
-------------------------------------------------------------------------------
