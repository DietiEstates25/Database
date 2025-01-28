/******************************************************************************
 * TYPE: trigger
 * NAME: tg_ads_type
 *
 * DESC: trigger to block any action but select on the ads_type table
 *****************************************************************************/
CREATE TRIGGER tg_ads_type
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_ads_type
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_infrastructure_tables_lock();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_estate_type
 *
 * DESC: trigger to block any action but select on the estate_type table
 *****************************************************************************/
CREATE TRIGGER tg_estate_type
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_estate_type
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_infrastructure_tables_lock();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_furniture_type
 *
 * DESC: trigger to block any action but select on the furniture_type table
 *****************************************************************************/
CREATE TRIGGER tg_furniture_type
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_furniture_type
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_infrastructure_tables_lock();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_energy_class_type
 *
 * DESC: trigger to block any action but select on the energy_class_type table
 *****************************************************************************/
CREATE TRIGGER tg_energy_class_type
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_energy_class_type
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_infrastructure_tables_lock();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_heating_type
 *
 * DESC: trigger to block any action but select on the heating_type table
 *****************************************************************************/
CREATE TRIGGER tg_heating_type
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_heating_type
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_infrastructure_tables_lock();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_air_cond_type
 *
 * DESC: trigger to block any action but select on the air_cond_type table
 *****************************************************************************/
CREATE TRIGGER tg_air_cond_type
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_air_cond_type
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_infrastructure_tables_lock();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_property_type
 *
 * DESC: trigger to block any action but select on the property_type table
 *****************************************************************************/
CREATE TRIGGER tg_property_type
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_property_type
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_infrastructure_tables_lock();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_condition_type
 *
 * DESC: trigger to block any action but select on the condition_type table
 *****************************************************************************/
CREATE TRIGGER tg_condition_type
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_condition_type
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_infrastructure_tables_lock();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_rental_contract_type
 *
 * DESC: trigger to block any action but select
 *       on the rental_contract_type table
 *****************************************************************************/
CREATE TRIGGER tg_rental_contract_type
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_rental_contract_type
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_infrastructure_tables_lock();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_rental_utilities_type
 *
 * DESC: trigger to block any action but select
 *       on the rental_utilities_type table
 *****************************************************************************/
CREATE TRIGGER tg_rental_utilities_type
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_rental_utilities_type
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_infrastructure_tables_lock();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_usr_type
 *
 * DESC: trigger to block any action but select on the usr_type table
 *****************************************************************************/
CREATE TRIGGER tg_usr_type
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_usr_type
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_infrastructure_tables_lock();
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: trigger
 * NAME: tg_action_type
 *
 * DESC: trigger to block any action but select on the action_type table
 *****************************************************************************/
CREATE TRIGGER tg_action_type
    BEFORE INSERT OR UPDATE OR DELETE
    ON tb_action_type
    FOR EACH STATEMENT
    EXECUTE FUNCTION tf_infrastructure_tables_lock();
-------------------------------------------------------------------------------
