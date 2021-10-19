create table c01 as
select
cams_points.ain,
cams_points.number,
cams_points.numsuffix,
cams_points.streetname,
cams_points.posttype,
cams_points.zipcode,
cams_points.fulladdress,
city_boundaries.city_name as geo_city,
cams_points.geom
from city_boundaries
join cams_points
on st_intersects(city_boundaries.geom, cams_points.geom)
where city_boundaries.city_name  not like 'Los Angeles';
