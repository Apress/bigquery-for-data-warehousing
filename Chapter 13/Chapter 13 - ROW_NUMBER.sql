SELECT ShoeType, 
       Color,
       ROW_NUMBER() OVER (PARTITION BY ShoeType ORDER BY Price DESC)
FROM Products
