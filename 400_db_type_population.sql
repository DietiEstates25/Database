INSERT INTO tb_ads_type ( type ) VALUES 
    ('RENTAL'),
    ('SALE');

INSERT INTO tb_estate_type ( type ) VALUES
    ('APARTMENT'),
    ('ATTIC'),
    ('CHALET'),
    ('COTTAGE'),
    ('FARMHOUSE'),
    ('HUT'),
    ('MANSION'),
    ('VILLA');

INSERT INTO tb_furniture_type ( type ) VALUES
    ('FURNISHED'),
    ('UNFURNISHED'),
    ('PARTIALLY_FURNISHED'),
    ('KITCHEN_ONLY');

INSERT INTO tb_energy_class_type ( type ) VALUES
    ('A4'),
    ('A3'),
    ('A2'),
    ('A1'),
    ('B'),
    ('C'),
    ('D'),
    ('E'),
    ('F'),
    ('G');

INSERT INTO tb_heating_type ( type ) VALUES
    ('ELECTRIC'),
    ('GAS'),
    ('HEAT_PUMP'),
    ('PELLET'),
    ('SOLAR'),
    ('WOOD');

INSERT INTO tb_air_cond_type ( type ) VALUES
    ('CENTRAL'),
    ('INDIVIDUAL'),
    ('NONE');

INSERT INTO tb_property_type ( type ) VALUES
    ('WHOLE'),
    ('NAKED'),
    ('PARTIAL'),
    ('USUFRUCT'),
    ('MULTIPROP'),
    ('SURFACE_RIGHTS');

INSERT INTO tb_condition_type ( type ) VALUES
    ('NEW'),
    ('GOOD'),
    ('OPTIMAL'),
    ('TO_BE_RENOVATED');


INSERT INTO tb_rental_contract_type ( type ) VALUES
    ('FREE_CANON'),
    ('AGREED_CANON'),
    ('TRANSITORIAL'),
    ('STUDENT');

INSERT INTO tb_rental_utilities_type ( type ) VALUES
    ('ONLY_ESSENTIALS'),
    ('ON_CONSUMPTION'),
    ('INCLUDED'),
    ('EXCLUDED');

INSERT INTO tb_usr_type ( id, type, is_bss ) VALUES
    (0, 'ROOT', TRUE),
    (1000, 'ADMIN', TRUE),
    (2000, 'AGENT', TRUE),
    (3000, 'USER', FALSE);

INSERT INTO tb_action_type( action ) VALUES
    ('VIEW'),
    ('BOOK'),
    ('OFFER');
