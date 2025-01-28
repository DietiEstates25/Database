/******************************************************************************
 * TYPE: schema
 * NAME: dieti_estate
 *
 * DESC: main schema for the real estate database system
 *****************************************************************************/
DROP SCHEMA IF EXISTS public CASCADE;
DROP SCHEMA IF EXISTS dieti_estate CASCADE;

CREATE SCHEMA dieti_estate;
CREATE SCHEMA public;

ALTER DATABASE ingsw_db
    SET search_path
    TO  dieti_estate, public;

ALTER USER ingsw
    SET search_path
    TO  dieti_estate, public;

SET search_path
    TO dieti_estate, public;
-------------------------------------------------------------------------------
