-- Version without analytic function
SELECT A.ID, A.Name, B.Name NameTwoEarlier
FROM A
JOIN A AS B
ON (A.ID - 2) = B.ID;

-- Version with analytic function
SELECT ID, Name, LAG(Name) NameTwoEarlier
FROM A
OVER (ORDER BY ID ROW 2 PRECEDING);