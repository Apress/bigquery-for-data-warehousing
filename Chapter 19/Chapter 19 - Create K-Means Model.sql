CREATE OR REPLACE MODEL metkmeans 
OPTIONS(model_type='kmeans', num_clusters=5) AS
SELECT 
department,
object_begin_date,
object_end_date,
classification,
artist_alpha_sort
FROM `bigquery-public-data.the_met.objects`     
WHERE object_begin_date < 2025 and object_end_date < 2025
