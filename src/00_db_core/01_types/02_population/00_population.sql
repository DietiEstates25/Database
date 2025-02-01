/******************************************************************************
 * TYPE: population
 *
 * DESC: populate the ads type table with before lockdown
 *****************************************************************************/
INSERT INTO tb_ads_type(type)
VALUES 
    ('RENTAL'),
    ('SALE');
-------------------------------------------------------------------------------


/******************************************************************************
* TYPE: population
*
* DESC: populate the estate type table with before lockdown
*****************************************************************************/
INSERT INTO tb_estate_type(type)
VALUES
    ('APARTMENT'),
    ('ATTIC'),
    ('CHALET'),
    ('COTTAGE'),
    ('FARMHOUSE'),
    ('HUT'),
    ('MANSION'),
    ('VILLA');
-------------------------------------------------------------------------------


/******************************************************************************
* TYPE: population
*
* DESC: populate the furniture type table with before lockdown
*****************************************************************************/
INSERT INTO tb_furniture_type(type)
VALUES
    ('FURNISHED'),
    ('UNFURNISHED'),
    ('PARTIALLY_FURNISHED'),
    ('KITCHEN_ONLY');
-------------------------------------------------------------------------------


/******************************************************************************
* TYPE: population
*
* DESC: populate the energy class type table with before lockdown
*****************************************************************************/
INSERT INTO tb_energy_class_type(type)
VALUES
    ('A4'),
    ('A3'),
    ('A2'),
    ('A1'),
    ('B'),
    ('C'),
    ('D'),
    ('E'),
    ('F'),
    ('G');
-------------------------------------------------------------------------------


/******************************************************************************
* TYPE: population
*
* DESC: populate the heating type table with before lockdown
*****************************************************************************/
INSERT INTO tb_heating_type(type)
VALUES
    ('ELECTRIC'),
    ('GAS'),
    ('HEAT_PUMP'),
    ('PELLET'),
    ('SOLAR'),
    ('WOOD');
-------------------------------------------------------------------------------


/******************************************************************************
* TYPE: population
*
* DESC: populate the air conditioning type table with before lockdown
*****************************************************************************/
INSERT INTO tb_air_cond_type(type)
VALUES
    ('CENTRAL'),
    ('INDIVIDUAL'),
    ('NONE');
-------------------------------------------------------------------------------


/******************************************************************************
* TYPE: population
*
* DESC: populate the property type table with before lockdown
*****************************************************************************/
INSERT INTO tb_property_type(type)
VALUES
    ('WHOLE'),
    ('NAKED'),
    ('PARTIAL'),
    ('USUFRUCT'),
    ('MULTIPROP'),
    ('SURFACE_RIGHTS');
-------------------------------------------------------------------------------


/******************************************************************************
* TYPE: population
*
* DESC: populate the condition type table with before lockdown
*****************************************************************************/
INSERT INTO tb_condition_type(type)
VALUES
    ('NEW'),
    ('GOOD'),
    ('OPTIMAL'),
    ('TO_BE_RENOVATED');
-------------------------------------------------------------------------------


/******************************************************************************
* TYPE: population
*
* DESC: populate the rental contract type table with before lockdown
*****************************************************************************/
INSERT INTO tb_rental_contract_type(type)
VALUES
    ('FREE_CANON'),
    ('AGREED_CANON'),
    ('TRANSITORIAL'),
    ('STUDENT');
-------------------------------------------------------------------------------


/******************************************************************************
* TYPE: population
*
* DESC: populate the rental utilities type table with before lockdown
*****************************************************************************/
INSERT INTO tb_rental_utilities_type(type)
VALUES
    ('ONLY_ESSENTIALS'),
    ('ON_CONSUMPTION'),
    ('INCLUDED'),
    ('EXCLUDED');
-------------------------------------------------------------------------------


/******************************************************************************
* TYPE: population
*
* DESC: populate the action type table with before lockdown
*****************************************************************************/
INSERT INTO tb_action_type(type)
VALUES
    ('VIEW'),
    ('BOOK'),
    ('OFFER');
-------------------------------------------------------------------------------


/******************************************************************************
* TYPE: population
*
* DESC: populate the user type table with before lockdown
*****************************************************************************/
INSERT INTO tb_bss_hierarchy(hierarchy)
VALUES
    ('ROOT'),
    ('ROOT.ADMIN'),
    ('ROOT.AGENT'),
    ('ROOT.ADMIN.AGENT');
-------------------------------------------------------------------------------
