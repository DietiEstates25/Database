/******************************************************************************
 * TYPE: constraint - unique
 * NAME: uq_bss_usr_id_id_agency
 *
 * DESC: unique constraint associating an id and id_agency
 *       for a business user
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT uq_bss_usr_id_id_agency
        UNIQUE (id, id_agency);
-------------------------------------------------------------------------------



/******************************************************************************
 * TYPE: constraint - unique
 * NAME: uq_bss_usr_id_hierarchy_id_agency
 *
 * DESC: unique constraint associating an id, hierarchy path and id_agency
 *       for a business user
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT uq_bss_usr_id_hierarchy_id_agency
        UNIQUE (id, hierarchy_path, id_agency);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [end/bss]_usr_fk_email
 *
 * DESC: foreign key constraint associating an user with an email 
 *****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['end', 'bss'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_usr '
                    'ADD CONSTRAINT %1$s_usr_fk_email '
                    'FOREIGN KEY (email) '
                    'REFERENCES tb_email(email) '
                    'ON DELETE cascade '
                    'ON UPDATE cascade',
                prefix
            );
        END LOOP;
 
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: bss_usr_fk_bss_usr_type
 *
 * DESC: foreign key constraint associating each business user with
 *       a business user type 
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT bss_usr_fk_bss_usr_type
        FOREIGN KEY (id_bss_usr_type, hierarchy_path)
        REFERENCES tb_bss_usr_type(id, hierarchy_path)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: bss_usr_fk_agency
 *
 * DESC: foreign key constraint associating each business user with an agency
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT bss_usr_fk_agency
        FOREIGN KEY (id_agency)
        REFERENCES tb_agency(id)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: bss_usr_fk_super_bss_usr
 *
 * DESC: foreign key constraint associating each business user with its super 
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT bss_usr_fk_super_bss_usr
        FOREIGN KEY (id_super_bss_usr, super_hierarchy_path, id_agency)
        REFERENCES tb_bss_usr(id, hierarchy_path, id_agency)
        ON DELETE cascade
        ON UPDATE cascade;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [end/bss]_usr_data_fk_[end/bss]_usr
 *
 * DESC: foreign key constraint associating user data with an user
 *****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['end', 'bss'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_usr_data '
                    'ADD CONSTRAINT %1$s_usr_data_fk_%1$s_usr '
                    'FOREIGN KEY (id_usr) '
                    'REFERENCES tb_%1$s_usr(id) '
                    'ON DELETE cascade '
                    'ON UPDATE cascade',
                prefix
            );
        END LOOP;
 
    END;
$$;
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: constraint - foreign key
 * NAME: [end/bss]_usr_phone_[end/bss]_usr
 *
 * DESC: foreign key constraint associating user phone number with an user
 *****************************************************************************/
DO
LANGUAGE plpgsql
$$
    DECLARE
        prefix_array    text[] := ARRAY['end', 'bss'];
        prefix          text;

    BEGIN
        FOREACH prefix IN ARRAY prefix_array LOOP
            EXECUTE format(
                'ALTER TABLE tb_%1$s_usr_phone '
                    'ADD CONSTRAINT %1$s_usr_phone_fk_%1$s_usr '
                    'FOREIGN KEY (id_usr) '
                    'REFERENCES tb_%1$s_usr(id) '
                    'ON DELETE cascade '
                    'ON UPDATE cascade',
                prefix
            );
        END LOOP;
 
    END;
$$;
-------------------------------------------------------------------------------
