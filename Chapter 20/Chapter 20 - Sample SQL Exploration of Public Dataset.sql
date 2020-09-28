SELECT
store_name,
store_location,
item_number,
item_description,
date period,
sale_dollars,
volume_sold_liters
FROM `bigquery-public-data.iowa_liquor_sales.sales`
WHERE date >= DATE(2018, 1, 1)
