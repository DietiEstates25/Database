CREATE OR REPLACE FUNCTION fn_new_tmp_bss_user(
    new_email       dm_email,
    new_role        dm_smp_str,    
    email_creator   dm_email
)
RETURNS integer
LANGUAGE plpgsql
AS $$
    DECLARE
        creator_id          integer;
        creator_usr_type_id integer;
        agency_id           integer;
        new_role_id         integer;
        new_usr_id          integer;
    BEGIN
        SELECT tb_usr.id, tb_usr.id_usr_type
        INTO STRICT creator_id, creator_usr_type_id
        FROM tb_usr
        WHERE tb_usr.email = email_creator AND tb_usr.is_bss;

        SELECT tb_usr_type.id
        INTO STRICT new_role_id
        FROM tb_usr_type
        WHERE tb_usr_type.type = new_role AND tb_usr_type.is_bss;

        IF (creator_record.id_usr_type >= new_role_id) THEN
           SELECT raise_custom_error('bss_hierarchy_violation');
        END IF;
    
        SELECT tb_bss_usr.id_agency
        INTO STRICT agency_id
        FROM tb_bss_usr
        WHERE tb_bss_usr.id_usr = creator_id;

        INSERT INTO tb_usr(
            email,
            id_usr_type,
            is_bss
        )
        VALUES (
            new_email,
            new_role_id,
            true 
        )
        RETURNING id INTO new_usr_id;

        INSERT INTO tb_tmp_bss_usr(
            id_usr,
            id_super,
            id_agency
        )
        VALUES (
            new_usr_id,
            creator_id,
            agency_id
        );

        RETURN (new_usr_id);

    END;
$$;



CREATE OR REPLACE FUNCTION fn_new_bss_usr(
    id_bss_usr integer
)
RETURNS void
LANGUAGE plpgsql
AS $$
    DECLARE
        super_id    integer;
        agency_id   integer;
        ctrl        integer;
    BEGIN
        SELECT 1
        INTO STRICT ctrl
        FROM tb_usr_data
        WHERE tb_usr_data.id_usr = id_bss_usr;

        SELECT 1
        INTO STRICT ctrl
        FROM tb_phone
        WHERE tb_phone.id_usr = id_bss_usr;

        SELECT tb_bss_usr.id_super, tb_bss_usr.id_agency
        INTO STRICT super_id, agency_id
        FROM tb_tmp_bss_usr
        WHERE tb_tmp_bss_usr.id_usr = id_bss_usr;

        INSERT INTO tb_bss_usr(
            id_usr,
            id_super,
            id_agency 
        )
        VALUES (
            id_bss_usr,
            super_id,
            agency_id
        );

        DELETE FROM tb_tmp_bss_usr
        WHERE tb_tmp_bss_usr.id_usr = id_bss_usr;

    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            SELECT raise_custom_error('bss_usr_not_found');
    END;
$$;
