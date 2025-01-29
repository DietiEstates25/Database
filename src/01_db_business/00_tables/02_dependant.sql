/* 
  TODO: discuss what to include in this table.
  * By doc the options are:
  * - COMMENTS: Comments for the copied columns, constraints, and indexes will be copied
  * - COMPRESSION: Compression method of the columns will be copied 
  * - DEFAULT: Default expressions for the copied column definitions will be copied
  *          NOTE: Note that copying defaults that call database-modification functions,
  *                such as nextval, may create a functional linkage between the original and new tables (serial?)
  * - GENERATED: Generated expressions for the copied column definitions will be copied
  * - IDENTITY: Identity columns will be copied
  * - INDEXES: Indexes will be copied (as PK, UNIQUE and EXCLUDE). New names for the indexes are automatically generated
  * - STORAGE: STORAGE settings for the copied column definitions will be copied.
  * - ALL: all of the above

  * Reference: https://www.postgresql.org/docs/current/sql-createtable.html
*/

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_bss_usr
 *
 * DESC: temporary table for business user registration process
 *****************************************************************************/
CREATE TABLE tb_tmp_bss_usr ( LIKE tb_bss_usr INCLUDING ALL);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_estate
 *
 * DESC: temporary table for property listing creation process
 *****************************************************************************/
CREATE TABLE tb_tmp_estate ( LIKE tb_estate INCLUDING ALL);

-- ALTER TABLE tb_tmp_estate
--     DROP COLUMN is_sold;
-------------------------------------------------------------------------------

-- FIXME: this cause problem with stats fk. Maybe we should consider
-- partitioning instead
/******************************************************************************
 * TYPE: table
 * NAME: tb_sold_estate
 *
 * DESC: table for storing sold properties.
 *****************************************************************************/
CREATE TABLE tb_sold_estate ( LIKE tb_tmp_estate);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_feature_sz
 *
 * DESC: temporary table for size-related features during property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_feature_sz ( LIKE tb_feature_sz);

ALTER TABLE tb_tmp_feature_sz
    DROP COLUMN total_area;
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_feature_floor
 *
 * DESC: temporary table for floor-related features during property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_feature_floor ( LIKE tb_feature_floor);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_feature_comp
 *
 * DESC: temporary table for composition features during property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_feature_comp ( LIKE tb_feature_comp);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_feature_energy_eff
 *
 * DESC: temporary table for energy efficiency features during
 *       property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_feature_energy_eff ( LIKE tb_feature_energy_eff);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_feature_condition
 *
 * DESC: temporary table for condition features during property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_feature_condition ( LIKE tb_feature_condition);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_feature_other
 *
 * DESC: temporary table for amenity and other features during
 *       property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_feature_other ( LIKE tb_feature_other);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_price
 *
 * DESC: temporary table for price information during property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_price ( LIKE tb_price);
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: table
 * NAME: tb_tmp_rental_info
 *
 * DESC: temporary table for rental information during property creation
 *****************************************************************************/
CREATE TABLE tb_tmp_rental_info ( LIKE tb_rental_info);
-------------------------------------------------------------------------------
