/******************************************************************************
 * TYPE: population
 *
 * DESC: populate the custom error messages table before locking it
 *****************************************************************************/
INSERT INTO tb_custom_errors (error_name, error_message, error_hint)
VALUES
    ('bss_hierarchy_violation',
        'Business role hierarchy violation',
        'Subordinate roles must be lower in hierarchy than superior roles'),
    ('bss_multiple_root_violation',
        'Multiple business user with root role in agency',
        'Only one business user can have the root role in an agency'),
    ('bss_agency_violation',
        'Business user agency violation',
        'Business user must belong to the same agency of his superior'),
    ('rental_violation',
        'Rental related action performed on non-rental property',
        'Rental info can be added or retrieved only for rental properties'),
    ('estate_violation',
        'Estate confirmation tried on incomplete temporary estate',
        'Estate confirmation can be done only on completed temporary estates,'
        ' be sure to have filled all temporary estate-related table before'
        ' trying again');
