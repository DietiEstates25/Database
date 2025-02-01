/******************************************************************************
 * TYPE: domain
 * NAME: dm_dob
 *
 * DESC: domain for date of birth that ensures user is over 18 years old
 *****************************************************************************/
CREATE DOMAIN dm_dob AS date
    CHECK (
        extract( year FROM (age(VALUE::timestamp)) ) >= 18
    );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: domain
 * NAME: dm_email
 *
 * DESC: domain for email addresses with format validation (RFC 5322)
 *****************************************************************************/
CREATE DOMAIN dm_email AS varchar(320)
    CHECK (
        VALUE ~ '^((?:[A-Za-z0-9!#$%&''*+\-\/=?^_`{|}~]|(?<=^|\.)"|"'
                '(?=$|\.|@)|(?<=".*)[.](?=.*")|(?<!\.)\.){1,64})(@)'
                '((?:[A-Za-z0-9.\-])*(?:[A-Za-z0-9])\.(?:[A-Za-z0-9]){2,})$'
    );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: domain
 * NAME: dm_int0plus
 *
 * DESC: domain for non-negative integers
 *****************************************************************************/
CREATE DOMAIN dm_int0plus AS integer
    CHECK (
        VALUE >= 0
    );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: domain
 * NAME: dm_phone
 *
 * DESC: domain for phone numbers with international format validation
 *****************************************************************************/
CREATE DOMAIN dm_phone AS varchar(16)
    CHECK (
        VALUE ~ '^\+?[0-9]{3,15}$'
    );
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: domain
 * NAME: dm_smp_str
 *
 * DESC: domain for strings (max 666 chars) that must:
 *       - Start with a letter (including accented)
 *       - End with a letter or period
 *       - Allow spaces, apostrophes, hyphens, and periods in middle
 *       - No consecutive spaces/punctuation
 *       - Support extended Latin alphabet (basic + accented chars)
 *****************************************************************************/
CREATE DOMAIN dm_smp_str AS varchar(666)
    CHECK (
        value ~ '(?=^'
                '[A-Za-zÀ-ÖØ-öø-ÿĀ-ſƀ-ɏə]'
                '[\s''-.A-Za-zÀ-ÖØ-öø-ÿĀ-ſƀ-ɏə]{0,98}'
                '[.A-Za-zÀ-ÖØ-öø-ÿĀ-ſƀ-ɏə]'
                '$)'
                '(?!.*('
                '[\s''-]{2}'
                '|'
                '[''-.]{2}'
                '|'
                '\s\.'
                '))'
    );
-------------------------------------------------------------------------------

/******************************************************************************
 * TYPE: domain
 * NAME: dm_usalnum
 *
 * DESC: domain for alphanumerical string with underscore as separator
 *****************************************************************************/
CREATE DOMAIN dm_usalnum AS text
    CHECK (
        VALUE ~ '^([0-9a-zA-Z]+_)*[0-9a-zA-z]+$'
    );
-------------------------------------------------------------------------------
