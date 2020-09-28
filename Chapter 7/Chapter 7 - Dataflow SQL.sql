SELECT TUMBLE_START('INTERVAL 1 MINUTE') interval, 
  t.Name, SUM(Price) TotalSales 
FROM bigquery.table.`{PROJECT}`.{DATASET}.Products t
INNER JOIN pubsub.topic.`{PROJECT}`.`NewSales` d
USING(SKU)
GROUP BY 
  TUMBLE(d.event_timestamp, 'INTERVAL 1 MINUTE'), Name
