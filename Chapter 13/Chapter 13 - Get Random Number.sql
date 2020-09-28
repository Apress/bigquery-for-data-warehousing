CREATE OR REPLACE PROCEDURE wbq.GetRandomNumber(IN Maximum INT64, OUT Answer INT64)
BEGIN
    SET Answer = CAST((SELECT FLOOR((RAND() * Maximum) + 1)) AS INT64);
END;
DECLARE Answer INT64 DEFAULT 0;
CALL wbq.GetRandomNumber(10, Answer);
SELECT Answer;
