/******************************************************************************
 * TYPE: constraint - unique
 * NAME: uq_tb_bss_usr
 *
 * DESC: unique constraint for business user (needed for references)
 *****************************************************************************/
ALTER TABLE tb_bss_usr
 ADD CONSTRAINT uq_tb_bss_usr
    UNIQUE (id, hierarchy_super_id);
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
 * NAME: bss_usr_fk_bss_hierarchy
 *
 * DESC: foreign key constraint associating each business user with
 *       a business hierarchy
 *****************************************************************************/
ALTER TABLE tb_bss_usr
    ADD CONSTRAINT bss_usr_fk_bss_hierarchy
        FOREIGN KEY (hierarchy_role)
        REFERENCES tb_bss_hierarchy(hierarchy)
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
