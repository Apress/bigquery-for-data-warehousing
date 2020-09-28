SELECT
  zip_code, 
  zipcodes.area_land_meters zip_area, 
  urban_area_code, 
  name, 
  cities.area_land_meters metro_area,
  (zipcodes.area_land_meters / cities.area_land_meters) ratio
FROM
  `bigquery-public-data.geo_us_boundaries.zip_codes` AS zipcodes
  inner join `bigquery-public-data.utility_us.us_cities_area` cities
  ON ST_INTERSECTS(zipcodes.zip_code_geom, cities.city_geom)
WHERE urban_area_code = '51445'
ORDER BY 6 DESC
