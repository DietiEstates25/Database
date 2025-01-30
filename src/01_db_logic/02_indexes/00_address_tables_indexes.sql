/******************************************************************************
 * TYPE: index
 * NAME: idx_address_on_city_neighborhood
 *
 * DESC: index for the city column in the address table
 *****************************************************************************/
CREATE INDEX idx_address_on_city_neighborhood
    ON tb_address(city,neighborhood);
-------------------------------------------------------------------------------
