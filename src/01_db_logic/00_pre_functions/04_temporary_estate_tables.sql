/******************************************************************************
 * TYPE: function
 * NAME: fn_get_feature_estate_tables
 *
 * DESC: returns an array with the names of the feature estate tables
 *****************************************************************************/
CREATE OR REPLACE FUNCTION get_feature_estate_tables()
RETURNS text[]
LANGUAGE plpgsql
AS $$
    DECLARE
        feature_estate_tables text[] := ARRAY[
            'ads_type',
            'estate_type',
            'address',
            'feature_sz',
            'feature_floor',
            'feature_comp',
            'feature_energy_eff',
            'feature_condition',
            'feature_other',
            'price',
            'rental_info'
        ];

    BEGIN
        RETURN (feature_estate_tables);
    END;
$$;
-------------------------------------------------------------------------------
