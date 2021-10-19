--drop table geocode_test;
create table geocode_test as
select
pcls.ain,
pcls.situshouseno,
pcls.situsfraction,
pcls.situsdirection,
pcls.situsstreet,
'' as posttype,
city_boundaries.city_name as geo_city,
pcls.situszip,
pcls.situsfulladdress,
st_x(st_centroid(pcls.geom)) as centoid_x,
st_y(st_centroid(pcls.geom)) as centoid_y,
st_astext(st_centroid(pcls.geom)) as wkt,
--fields used to test geocoding
pcls.situsaddress as g_address,
replace(pcls.situscity, ' CA', '') as g_city,
'CA' as g_state,
left(pcls.situszip, 5) as g_zip
from (select * from parcels where situshouseno > '0') as pcls
left join cams_plus
on ST_Intersects(pcls.geom, cams_plus.geom)
left join city_boundaries
on ST_Intersects(city_boundaries.geom, ST_Centroid(pcls.geom))
where cams_plus.fulladdress is null
;
