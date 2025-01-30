/******************************************************************************
 * TYPE: table
 * NAME: tb_asd_type
 *
 * DESC: table of the possible types of real estate advertisment
 *****************************************************************************/
CREATE TABLE tb_ads_type (LIKE tb_template_type INCLUDING ALL);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_estate_type
 *
 * DESC: table of the possible types of real estate properties
 *       (apartment, house, etc.)
 *****************************************************************************/
CREATE TABLE tb_estate_type (LIKE tb_template_type INCLUDING ALL);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_furniture_type
 *
 * DESC: table of the possible furniture states of properties
 *       (furnished, unfurnished, etc.)
 *****************************************************************************/
CREATE TABLE tb_furniture_type (LIKE tb_template_type INCLUDING ALL);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_energy_class_type
 *
 * DESC: table of energy efficiency classifications for properties
 *       (A, B, C, etc.)
 *****************************************************************************/
CREATE TABLE tb_energy_class_type (LIKE tb_template_type INCLUDING ALL);
-------------------------------------------------------------------------------
 

/******************************************************************************
 * TYPE: table
 * NAME: tb_heating_type
 *
 * DESC: table of possible heating system types
 *       (central, autonomous, etc.)
 *****************************************************************************/
CREATE TABLE tb_heating_type (LIKE tb_template_type INCLUDING ALL);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_air_cond_type
 *
 * DESC: table of possible air conditioning system types
 *       (warm, cold, etc.)
 *****************************************************************************/
CREATE TABLE tb_air_cond_type (LIKE tb_template_type INCLUDING ALL);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_property_type
 *
 * DESC: table of property ownership types
 *       (freehold, leasehold, etc.)
 *****************************************************************************/
CREATE TABLE tb_property_type (LIKE tb_template_type INCLUDING ALL);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_condition_type
 *
 * DESC: table of possible property conditions
 *       (new, renovated, to be renovated, etc.)
 *****************************************************************************/
CREATE TABLE tb_condition_type (LIKE tb_template_type INCLUDING ALL);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_rental_contract_type
 *
 * DESC: table of possible rental contract types
 *       (short-term, long-term, etc.)
 *****************************************************************************/
CREATE TABLE tb_rental_contract_type (LIKE tb_template_type INCLUDING ALL);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_rental_utilities_type
 *
 * DESC: table of possible utility inclusion types in rental properties
 *****************************************************************************/
CREATE TABLE tb_rental_utilities_type (LIKE tb_template_type INCLUDING ALL);
-------------------------------------------------------------------------------
