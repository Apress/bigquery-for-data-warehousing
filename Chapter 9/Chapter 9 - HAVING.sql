SELECT Department, SUM(Cost) TotalCost
FROM Expenses
GROUP BY Department
HAVING SUM(Cost) > 1000
