/******************************************************************************
 * TYPE: tables
 * NAME: tb_name_type
 *
 * DESC: create type tables
 *
 *
 * NAME: tb_asd_type
 * DESC: table of the possible types of real estate advertisment
 *
 * NAME: tb_estate_type
 * DESC: table of the possible types of real estate properties
 *       (apartment, house, etc.)
 *
 * NAME: tb_furniture_type
 * DESC: table of the possible furniture states of properties
 *       (furnished, unfurnished, etc.)
 *
 * NAME: tb_energy_class_type
 * DESC: table of energy efficiency classifications for properties
 *       (A, B, C, etc.)
 *
 * NAME: tb_heating_type
 * DESC: table of possible heating system types
 *       (central, autonomous, etc.)
 *
 * NAME: tb_air_cond_type
 * DESC: table of possible air conditioning system types
 *       (warm, cold, etc.)
 *
 * NAME: tb_property_type
 * DESC: table of property ownership types
 *       (freehold, leasehold, etc.)
 *
 * NAME: tb_condition_type
 * DESC: table of possible property conditions
 *       (new, renovated, to be renovated, etc.)
 *
 * NAME: tb_rental_contract_type
 * DESC: table of possible rental contract types
 *       (short-term, long-term, etc.)
 *
 * NAME: tb_rental_utilities_type
 * DESC: table of possible utility inclusion types in rental properties
 *
 * NAME: tb_action_type
 * DESC: table defining user possible action
 *****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        type_tables text[];
        table_name  text;

    BEGIN
        type_tables := fn_get_type_tables();

        FOREACH table_name IN ARRAY type_tables LOOP
            EXECUTE format(
                'CREATE TABLE tb_%1$s_type ('
                    'LIKE tb_template_type INCLUDING ALL'
                ')',
                table_name
            );    
        END LOOP; 

    END;
$$;
-------------------------------------------------------------------------------
