-- declare the variables we'll need
DECLARE DIE1, DIE2, TOTAL INT64;
-- declare the special result string
DECLARE RESULT STRING;
-- generate two random numbers and set the variables. sum them to get the total.
SET (DIE1, DIE2) = (CAST(FLOOR(RAND() * 6) + 1 AS INT64), CAST(FLOOR(RAND() * 6) + 1 AS INT64));
SET TOTAL = DIE1 + DIE2;

-- check for some special results with an if block and set the result.
IF (DIE1 = 1 AND DIE2 = 1) THEN SET RESULT = "Snake eyes.";
ELSEIF (DIE1 = 6 AND DIE2 = 6) THEN SET RESULT = "Boxcars.";
ELSEIF (DIE1 = 4 AND DIE2 = 4) THEN SET RESULT = "Hard eight.";
ELSE SET RESULT = "Nothing special.";
END IF;

-- return the results to the user
SELECT FORMAT("You rolled %d and %d for a total of %d. %s", DIE1, DIE2, TOTAL, RESULT);
