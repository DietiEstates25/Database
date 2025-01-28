/******************************************************************************
 * TYPE: index
 * NAME: idx_ads_type_on_type
 *
 * DESC: index for the type column in the ads_type table
 *****************************************************************************/
CREATE INDEX idx_ads_type_on_type
    ON tb_ads_type(type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_estate_type_on_type
 *
 * DESC: index for the type column in the estate_type table
 *****************************************************************************/
CREATE INDEX idx_estate_type_on_type
    ON tb_estate_type(type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_furniture_type_on_type
 *
 * DESC: index for the type column in the furniture_type table
 *****************************************************************************/
CREATE INDEX idx_furniture_type_on_type
    ON tb_furniture_type(type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_energy_class_type_on_type
 *
 * DESC: index for the type column in the energy_class_type table
 *****************************************************************************/
CREATE INDEX idx_energy_class_type_on_type
    ON tb_energy_class_type(type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_heating_type_on_type
 *
 * DESC: index for the type column in the heating_type table
 *****************************************************************************/
CREATE INDEX idx_heating_type_on_type
    ON tb_heating_type(type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_air_cond_type_on_type
 *
 * DESC: index for the type column in the air_cond_type table
 *****************************************************************************/
CREATE INDEX idx_air_cond_type_on_type
    ON tb_air_cond_type(type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_property_type_on_type
 *
 * DESC: index for the type column in the property_type table
 *****************************************************************************/
CREATE INDEX idx_property_type_on_type
    ON tb_property_type(type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_condition_type_on_type
 *
 * DESC: index for the type column in the condition_type table
 *****************************************************************************/
CREATE INDEX idx_condition_type_on_type
    ON tb_condition_type(type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_rental_contract_type_on_type
 *
 * DESC: index for the type column in the rental_contract_type table
 *****************************************************************************/
CREATE INDEX idx_rental_contract_type_on_type
    ON tb_rental_contract_type(type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_rental_utilities_type_on_type
 *
 * DESC: index for the type column in the rental_utilities_type table
 *****************************************************************************/
CREATE INDEX idx_rental_utilities_type_on_type
    ON tb_rental_utilities_type(type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_aciton_on_action
 *
 * DESC: index for the action column in the action table
 *****************************************************************************/
CREATE INDEX idx_aciton_on_action
    ON tb_action_type(action);
-------------------------------------------------------------------------------