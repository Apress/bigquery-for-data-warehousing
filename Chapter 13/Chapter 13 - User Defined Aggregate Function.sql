-- Defining the aggregate function
CREATE OR REPLACE FUNCTION fake_avg(input ANY TYPE)
AS ((SELECT AVG(x) FROM UNNEST(input) x));

-- Using it as an aggregate function
SELECT fake_avg(ARRAY_AGG(x)) FROM input;

-- Using it as an aggregate, analytic function
SELECT fake_avg(ARRAY_AGG(x) OVER()) FROM input;
