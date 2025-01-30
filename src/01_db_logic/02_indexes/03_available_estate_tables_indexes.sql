/******************************************************************************
 * TYPE: index
 * NAME: idx_estate_on_address
 *
 * DESC: index for the id_address column in the estate table
 *****************************************************************************/
CREATE INDEX idx_estate_on_address
    ON tb_available_estate(id_address);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_estate_on_bss_usr
 *
 * DESC: index for the id_bss_usr column in the estate table
 *****************************************************************************/
CREATE INDEX idx_estate_on_bss_usr
    ON tb_available_estate(id_bss_usr);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_estate_on_estate_type
 *
 * DESC: index for the id_estate_type column in the estate table
 *****************************************************************************/
CREATE INDEX idx_estate_on_estate_type
    ON tb_available_estate(id_estate_type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_feature_sz_on_main_area
 *
 * DESC: index for the main_area column in the feature_sz table
 *****************************************************************************/
CREATE INDEX idx_feature_sz_on_main_area
    ON tb_available_feature_sz(total_area);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_feature_floor_on_estate_floor
 *
 * DESC: index for the estate_floor column in the feature_floor table
 *****************************************************************************/
CREATE INDEX idx_feature_floor_on_estate_floor
    ON tb_available_feature_floor(estate_floor);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_feature_comp_on_rooms
 *
 * DESC: index for the rooms column in the feature_comp table
 *****************************************************************************/
CREATE INDEX idx_feature_comp_on_rooms
    ON tb_available_feature_comp(rooms);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_feature_comp_on_bathrooms
 *
 * DESC: index for the bathrooms column in the feature_comp table
 *****************************************************************************/
CREATE INDEX idx_feature_comp_on_bathrooms
    ON tb_available_feature_comp(bathrooms);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_feature_energy_eff_on_energy_class
 *
 * DESC: index for the id_energy_class_type column in the feature_energy_eff
 *       table
 *****************************************************************************/
CREATE INDEX idx_feature_energy_eff_on_energy_class
    ON tb_available_feature_energy_eff(id_energy_class_type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_feature_energy_eff_on_heating_type
 *
 * DESC: index for the id_heating_type column in the feature_energy_eff table
 *****************************************************************************/
CREATE INDEX idx_feature_energy_eff_on_heating_type
    ON tb_available_feature_energy_eff(id_heating_type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_feature_ee_on_ac_type
 *
 * DESC: index for the id_air_cond_type column in the feature_energy_eff table
 *****************************************************************************/
CREATE INDEX idx_feature_ee_on_ac_type
    ON tb_available_feature_energy_eff(id_air_cond_type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_feature_condition_on_condition
 *
 * DESC: index for the id_condition_type column in the feature_condition table
 *****************************************************************************/
CREATE INDEX idx_feature_condition_on_condition
    ON tb_available_feature_condition(id_condition_type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_feature_condition_on_property_type
 *
 * DESC: index for the id_property_type column in the feature_condition table
 *****************************************************************************/
CREATE INDEX idx_feature_condition_on_property_type
    ON tb_available_feature_condition(id_property_type);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: index
 * NAME: idx_price_on_price
 *
 * DESC: index for the price column in the price table
 *****************************************************************************/
CREATE INDEX idx_price_on_price
    ON tb_available_price(price);
-------------------------------------------------------------------------------
