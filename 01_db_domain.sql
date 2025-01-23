/******************************************************************************
 * TYPE: domain
 * NAME: dm_dob
 *
 * DESC: domain for date of birth that ensures user is over 18 years old
 *****************************************************************************/
CREATE DOMAIN dm_dob AS date CHECK (
    extract( year FROM (age(VALUE::timestamp)) ) > 18
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: domain
 * NAME: dm_email
 *
 * DESC: domain for email addresses with format validation -- TODO: quale standard?
 *****************************************************************************/
CREATE DOMAIN dm_email AS varchar(320) CHECK (
    VALUE ~ '^((?:[A-Za-z0-9!#$%&''*+\-\/=?^_`{|}~]|'
            '(?<=^|\.)"|"(?=$|\.|@)|(?<=".*)[.](?=.*")|(?<!\.)\.){1,64})(@)'
            '((?:[A-Za-z0-9.\-])*(?:[A-Za-z0-9])\.(?:[A-Za-z0-9]){2,})$'
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: domain
 * NAME: dm_int0plus
 *
 * DESC: domain for non-negative integers
 *****************************************************************************/
CREATE DOMAIN dm_int0plus AS integer CHECK (
    VALUE >= 0
);
-------------------------------------------------------------------------------


/******************************************************************************
 * TYPE: domain
 * NAME: dm_phone
 *
 * DESC: domain for phone numbers with international format validation
 *****************************************************************************/
CREATE DOMAIN dm_phone AS varchar(16) CHECK (
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
CHECK
(
	value ~ '(?=^'
				'['
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
					'\u0259'
				']'
				'['
					'\u0020'
					'\u0027'
					'\u002D'
					'\u002E'
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
					'\u0259'
				']{0,98}'
				'['
					'\u002E'
					'\u0041-\u005A'
					'\u0061-\u007A'
					'\u00C0-\u00D6'
					'\u00D8-\u00F6'
					'\u00F8-\u00FF'
					'\u0100-\u017F'
					'\u0180-\u024F'
					'\u0259'
				']'
			'$)'
			'(?!.*('
				'[\u0020\u0027\u002D]{2}'
				'|'
				'[\u0027\u002D\u002E]{2}'
				'|'
				'\u0020\u002E'
			'))'
);
-------------------------------------------------------------------------------
