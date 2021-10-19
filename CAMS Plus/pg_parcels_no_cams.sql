--drop table parcels_no_cams;
create table parcels_no_cams as
select
pcls.ain,
pcls.situshouseno,
pcls.situsfraction,
pcls.situsdirection,
pcls.situsunit,
pcls.situsstreet,
pcls.situsaddress,
pcls.situscity,
'CA' as situsstate,
pcls.situszip,
city_boundaries.city_name as geo_city,
--cams_points.fulladdress,
ST_Centroid(pcls.geom) as geom
from (select * from parcels where situshouseno > '0') as pcls
left join cams_points
on ST_Intersects(pcls.geom, cams_points.geom)
left join city_boundaries
on ST_Intersects(city_boundaries.geom, ST_Centroid(pcls.geom))
where cams_points.fulladdress is null
;