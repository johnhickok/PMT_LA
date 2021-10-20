-- Load parcels with no CAMS points after points removed by geocoding
insert into cams_plus (
ain,
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
user_ain,
user_situshouseno::int,
user_situsfraction,
user_situsdirection,
user_situsstreet,
user_posttype,
user_geo_city,
left(user_situszip, 5),
user_situsfulladdress,
st_geometryfromtext(user_wkt, 2229) as geom
from public.parcels_no_cams_geocoded
where score = 0;
