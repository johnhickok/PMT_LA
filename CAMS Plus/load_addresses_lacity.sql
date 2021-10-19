insert into cams_plus_1 (
	number,
	numsuffix,
	predir,
	streetname,
	posttype,
	geo_city,
	zipcode,
	fulladdress,
	geom
)
select
hse_nbr::integer,
hse_frac_nbr,
hse_dir_cd,
str_nm,
str_sfx_cd,
'Los Angeles',
zip_cd,
hse_nbr || ' ' || 
hse_frac_nbr || ' ' ||
hse_dir_cd || ' ' ||
str_nm || ' ' ||
str_sfx_cd || ' Los Angeles ' ||
zip_cd,
ST_SetSRID(ST_MakePoint(x_coord_nbr::numeric, y_coord_nbr::numeric), 2229)
from public.addresses_lacity;
