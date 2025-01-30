/******************************************************************************
 * TYPE: function - immutable
 * NAME: fn_calculate_tot_area
 *
 * DESC: calculate the total area of a property based on all the areas.
 *       The function also considers the number of indoor and outdoor parking.
 *       The function is immutable to be used as generated column.
 *****************************************************************************/
CREATE OR REPLACE FUNCTION fn_calculate_tot_area(
    main_area       integer,
    storage_area    integer,
    terrace_area    integer,
    balcony_area    integer,
    garden_area     integer,
    garage_area     integer,
    n_indoor_park   integer,
    n_outdoor_park  integer
)
RETURNS integer
LANGUAGE plpgsql
IMMUTABLE
AS $$
    DECLARE
        total_area  real := 0.0;
        ip          real := 0.0;
    BEGIN 
        total_area = total_area + main_area;
        total_area = total_area + storage_area * 0.2;

        IF (terrace_area > 25) THEN
            total_area = total_area + 8.75;
            total_area = total_area + (terrace_area - 25) * 0.1;
        ELSE
            total_area = total_area + terrace_area * 0.35;
        END IF;

        IF (balcony_area > 25) THEN
            total_area = total_area + 6.25;
            total_area = total_area + (balcony_area - 25) * 0.1;
        ELSE
            total_area = total_area + terrace_area * 0.25;
        END IF;

        IF (garden_area > 25) THEN
            total_area = total_area + 3.75;
            total_area = total_area + (garden_area - 25) * 0.05;
        ELSE
            total_area = total_area + garden_area * 0.15;
        END IF;

        IF (garden_area > 25) THEN
            total_area = total_area + 3.75;
            total_area = total_area + (garden_area - 25) * 0.05;
        ELSE
            total_area = total_area + garden_area * 0.15;
        END IF;

        IF (n_indoor_park + n_outdoor_park = 0) THEN
            RETURN (total_area::integer);
        END IF;

        ip := (n_indoor_park::real / (n_indoor_park + n_outdoor_park));

        total_area = total_area + ip * garage_area * 0.35;
        total_area = total_area + (1.0 - ip) * garage_area * 0.2;

        RETURN (total_area::integer);
    END;
$$;