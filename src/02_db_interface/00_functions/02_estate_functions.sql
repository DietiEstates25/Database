CREATE OR REPLACE FUNCTION get_tmp_estate_tables(
    id_tmp_estate   integer
)
RETURNS text[]
LANGUAGE plpgsql
AS $$
    DECLARE
        tmp_estate_tables text[] := ARRAY[
            'estate',
            'feature_sz',
            'feature_floor',
            'feature_comp',
            'feature_energy_eff',
            'feature_condition',
            'feature_other',
            'price'
        ];

        is_rent     boolean;

    BEGIN
        SELECT (tb_ads_type.type = 'RENT')
        INTO is_rent
        FROM tb_tmp_available_estate JOIN tb_ads_type
            ON tb_tmp_available_estate.id_ads_type = tb_ads_type.id
        WHERE tb_tmp_available_estate.id = id_tmp_estate;

        IF (is_rent) THEN
            tmp_estate_tables := array_append(
                tmp_estate_tables,
                'rental_info'
            );
        END IF;

        RETURN (tmp_estate_tables);

    END;
$$;


CREATE OR REPLACE FUNCTION fn_new_available_estate(
    id_tmp_estate integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
    DECLARE
        estate_tables   text[];
        table_name      text;
        tmp_record      record;
        new_estate_id   integer;

    BEGIN
        estate_tables := get_tmp_estate_tables(id_tmp_estate);

        INSERT INTO tb_estate
        DEFAULT VALUES
        RETURNING id INTO new_estate_id;

        PREPARE get_record(text, integer) AS
            SELECT *
            INTO STRICT tmp_record
            FROM tb_tmp_$1
            WHERE tb_tmp_$1.id_estate = $2;

        PREPARE insert_record(text, record) AS
            INSERT INTO tb_available_$1
            VALUES ($2.*);
            
        FOREACH table_name IN ARRAY tmp_estate_tables LOOP
            EXECUTE get_record(table_name, id_tmp_estate);
            tmp_record.id_estate = new_estate_id;
            EXECUTE insert_record(table_name, tmp_record); 
        END LOOP;

        DELETE FROM tb_tmp_estate
        WHERE tb_tmp_estate.id = id_tmp_estate;
            
    END;
$$;
