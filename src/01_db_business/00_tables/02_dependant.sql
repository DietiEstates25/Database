/* 
  TODO: discuss what to include in this table.
*/

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_bss_usr
 *
 * DESC: temporary table for business user registration process
 *****************************************************************************/
CREATE TABLE tb_tmp_bss_usr (LIKE tb_bss_usr INCLUDING ALL);
-------------------------------------------------------------------------------

-- TODO: ?? LIKE tb_available_estate ??
/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_estate
 *
 * DESC: temporary table for property listing creation process
 *****************************************************************************/
CREATE TABLE tb_tmp_estate (LIKE tb_estate INCLUDING ALL);

-- ALTER TABLE tb_tmp_estate
--     DROP COLUMN is_sold;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: table
 * NAME: tb_available_estate & tb_not_available_estate
 *
 * DESC: partitioned tables for available and not available properties
 *****************************************************************************/
CREATE TABLE tb_available_estate PARTITION OF tb_estate
    FOR VALUES IN (true);

CREATE TABLE tb_not_available_estate PARTITION OF tb_estate
    FOR VALUES IN (false);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_feature_sz
 *
 * DESC: temporary table for size-related features during property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_feature_sz (LIKE tb_feature_sz INCLUDING ALL);

ALTER TABLE tb_tmp_feature_sz
    DROP COLUMN total_area;
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_feature_floor
 *
 * DESC: temporary table for floor-related features during property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_feature_floor (LIKE tb_feature_floor INCLUDING ALL );
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_feature_comp
 *
 * DESC: temporary table for composition features during property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_feature_comp (LIKE tb_feature_comp);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_feature_energy_eff
 *
 * DESC: temporary table for energy efficiency features during
 *       property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_feature_energy_eff (LIKE tb_feature_energy_eff);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_feature_condition
 *
 * DESC: temporary table for condition features during property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_feature_condition (LIKE tb_feature_condition);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_feature_other
 *
 * DESC: temporary table for amenity and other features during
 *       property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_feature_other (LIKE tb_feature_other);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_price
 *
 * DESC: temporary table for price information during property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_price (LIKE tb_price);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_rental_info
 *
 * DESC: temporary table for rental information during property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_rental_info (LIKE tb_rental_info);
-------------------------------------------------------------------------------
