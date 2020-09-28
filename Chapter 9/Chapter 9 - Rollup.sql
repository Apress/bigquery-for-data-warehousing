SELECT Department, SUM(Cost) TotalCost
FROM Expenses
GROUP BY Department
ORDER BY TotalCost DESC
GROUP BY ROLLUP(Department)
