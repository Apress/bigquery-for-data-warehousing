SELECT Department, COUNTIF(Cost > 25)
FROM Expenses
GROUP BY Department
