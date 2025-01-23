DROP SCHEMA IF EXISTS dieti_estate CASCADE;

CREATE SCHEMA dieti_estate;

SET search_path TO dieti_estate, public;

CREATE DOMAIN dm_dob AS date
  CHECK (
    extract(year FROM (age(VALUE::timestamp))) > 18
  );

CREATE DOMAIN dm_email AS varchar(320)
  CHECK (
    VALUE ~ '^((?:[A-Za-z0-9!#$%&''*+\-\/=?^_`{|}~]|(?<=^|\.)"|"(?=$|\.|@)|(?<=".*)[.](?=.*")|(?<!\.)\.){1,64})(@)((?:[A-Za-z0-9.\-])*(?:[A-Za-z0-9])\.(?:[A-Za-z0-9]){2,})$'
  );

CREATE TYPE ty_gender AS ENUM (
  'M',
  'F',
  'O'
);

CREATE DOMAIN dm_int0plus AS integer
  CHECK (
    VALUE >= 0
  );

CREATE DOMAIN dm_phone AS varchar(16)
  CHECK (
    VALUE ~ '^\+?[0-9]{3,15}$'
  );

CREATE DOMAIN dm_smp_str AS varchar(666)
  CHECK (
  	VALUE ~ '(?=^'
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

