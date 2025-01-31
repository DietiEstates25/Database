/******************************************************************************
 * TYPE: function
 * NAME: fn_get_type_tables
 *
 * DESC: returns an array with the names of the type tables
 *****************************************************************************/
CREATE OR REPLACE FUNCTION fn_get_type_tables()
RETURNS text[]
LANGUAGE plpgsql
AS $$
    DECLARE
        type_tables text[] := ARRAY[
            'bss_usr',
            'ads',
            'estate',
            'furniture',
            'energy_class',
            'heating',
            'air_cond',
            'property',
            'condition',
            'rental_contract',
            'rental_utilities',
            'action'
        ];

    BEGIN
        RETURN (type_tables);

    END;

$$;
-------------------------------------------------------------------------------
