/******************************************************************************
 * TYPE: table
 * NAME: tb_usr
 *
 * DESC: table storing info for all system users
 *****************************************************************************/
CREATE TABLE tb_usr (
    id          serial PRIMARY KEY,
    email       dm_email UNIQUE NOT NULL,
    creation    timestamp NOT NULL DEFAULT NOW(),
    id_usr_type integer NOT NULL,
    is_bss      boolean NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_usr_data
 *
 * DESC: table storing personal information of all system users
 *****************************************************************************/
CREATE TABLE tb_usr_data (
    id_usr      integer PRIMARY KEY,
    first_name  dm_smp_str NOT NULL,
    last_name   dm_smp_str NOT NULL,
    dob         dm_dob NOT NULL,
    gender      ty_gender NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_phone
 *
 * DESC: table storing phone numbers associated with user email addresses
 *****************************************************************************/
CREATE TABLE tb_phone (
    id_usr  integer PRIMARY KEY,
    phone   dm_phone UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_agency
 *
 * DESC: table storing real estate agency information
 *****************************************************************************/
CREATE TABLE tb_agency (
    id          serial PRIMARY KEY,
    name        dm_smp_str UNIQUE NOT NULL,
    id_address  integer NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_bss_usr
 *
 * DESC: table storing business user information including role
 *       and agency affiliations
 *****************************************************************************/
CREATE TABLE tb_bss_usr (
    id_usr      integer PRIMARY KEY,
    id_super    integer,
    id_agency   integer NOT NULL
);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_bss_usr
 *
 * DESC: table storing temporary business user information including role
 *       and agency affiliations for creation process
 *****************************************************************************/
CREATE TABLE tb_tmp_bss_usr (
    LIKE tb_bss_usr INCLUDING ALL
);
-------------------------------------------------------------------------------
