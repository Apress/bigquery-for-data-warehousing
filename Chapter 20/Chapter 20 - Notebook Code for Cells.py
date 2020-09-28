PROJECT_ID = 'your-project-id-here'
from google.cloud import bigquery
bigquery_client = bigquery.Client(project=PROJECT_ID)

sql = """
SELECT
store_number,
ANY_VALUE(store_location) store_location,
item_number,
ANY_VALUE(item_description) item_description,
DATE_TRUNC(date, MONTH) period,
ROUND(SUM(sale_dollars),2) sale_dollars,
ROUND(SUM(volume_sold_liters),2) volume_sold_liters,
FROM `bigquery-public-data.iowa_liquor_sales.sales`
WHERE date BETWEEN DATE(2019, 1, 1) AND DATE(2019, 12, 31)
GROUP BY store_number, item_number, period
"""
df = biquery_client.query(sql).to_dataframe()
df[:10]
