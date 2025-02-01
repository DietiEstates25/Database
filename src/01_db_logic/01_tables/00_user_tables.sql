/******************************************************************************
 * TYPE: table
 * NAME: tb_email
 *
 * DESC: table storing emails
 *****************************************************************************/
CREATE TABLE tb_email (
    email       dm_email PRIMARY KEY,
    is_valid    boolean NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_phone
 *
 * DESC: table storing phone numbers 
 *****************************************************************************/
CREATE TABLE tb_phone (
    phone       dm_phone UNIQUE NOT NULL,
    is_valid    boolean NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_agency
 *
 * DESC: table storing real estate agency information
 *****************************************************************************/
CREATE TABLE tb_agency (
    id              serial PRIMARY KEY,
    name            dm_smp_str UNIQUE NOT NULL,
    street          text NOT NULL,
    st_number       text NOT NULL,
    city            text NOT NULL,
    state_province  text NOT NULL,
    postal_code     text NOT NULL,
    country         text NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_end_usr
 *
 * DESC: table storing info for all system end users (not business)
 *****************************************************************************/
CREATE TABLE tb_end_usr (
    id          serial PRIMARY KEY,
    email       dm_email UNIQUE NOT NULL,
    creation    timestamp NOT NULL DEFAULT NOW()
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_bss_usr
 *
 * DESC: table storing info for all system business users
 *****************************************************************************/
CREATE TABLE tb_bss_usr (
    LIKE tb_end_usr INCLUDING ALL
);

ALTER TABLE tb_bss_usr
    ADD COLUMN hierarchy_role       ltree NOT NULL,
    ADD COLUMN hierarchy_super_id   ltree NOT NULL,
    ADD COLUMN completed            boolean NOT NULL DEFAULT false,
    ADD COLUMN verified             timestamp DEFAULT NULL;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_end_usr_data
 *
 * DESC: table storing personal information of all system end users
 *****************************************************************************/
CREATE TABLE tb_end_usr_data (
    id_usr      integer PRIMARY KEY,
    first_name  dm_smp_str NOT NULL,
    last_name   dm_smp_str NOT NULL,
    dob         dm_dob NOT NULL,
    gender      ty_gender NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_end_usr_phone
 *
 * DESC: table storing phone numbers associated with end user
 *****************************************************************************/
CREATE TABLE tb_end_usr_phone (
    id_usr  integer PRIMARY KEY,
    phone   dm_phone UNIQUE NOT NULL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_bss_usr_data
 *
 * DESC: table storing personal information of all system business users
 *****************************************************************************/
CREATE TABLE tb_bss_usr_data (
    LIKE tb_end_usr_data INCLUDING ALL
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_bss_usr_phone
 *
 * DESC: table storing phone numbers associated with business user
 *****************************************************************************/
CREATE TABLE tb_bss_usr_phone (
    LIKE tb_end_usr_phone INCLUDING ALL
);
-------------------------------------------------------------------------------
