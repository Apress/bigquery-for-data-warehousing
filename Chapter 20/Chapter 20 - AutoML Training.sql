INSERT INTO `your-project.dataset.table_name`
SELECT
DATE_TRUNC(date, WEEK) period,
county_number,
category,
ROUND(SUM(sale_dollars),2) sale_dollars,
ROUND(SUM(volume_sold_liters),2) volume_sold_liters,
FROM `bigquery-public-data.iowa_liquor_sales.sales`
WHERE date <= DATE(2018, 12, 31)
GROUP BY period, county_number, category
