/******************************************************************************
 * TYPE: constraint - unique
 * NAME: unique_coordinates

 * DESC: unique constraint for the coordinates
 *****************************************************************************/
ALTER TABLE tb_address
    ADD CONSTRAINT unique_coordinates
        UNIQUE (latitude, longitude);
-------------------------------------------------------------------------------
