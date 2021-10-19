--troubles with this script, probably non utf8 chars in the data
select 
user_ain,
user_situshouseno,
user_situsfraction,
user_situsdirection,
user_situsstreet,
user_posttype,
user_geo_city,
user_situszip,
user_situsfulladdress,
ST_SetSRID(ST_MakePoint(
	user_centoid_x::double precision, 
	user_centoid_y::double precision
    ),2229) as geom
from public.parcel_geocode_results
where score = 0;
