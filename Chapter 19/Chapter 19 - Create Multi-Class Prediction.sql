SELECT confusion, COUNT(confusion), COUNT(confusion)/ANY_VALUE(total)
FROM
(
SELECT         CASE 
               WHEN survived = 1 and predicted_survived = 0 THEN 1
               WHEN survived = 1 and predicted_survived = 1 THEN 2
               WHEN survived = 0 and predicted_survived = 1 THEN 3
               WHEN survived = 0 and predicted_survived = 0 THEN 4
               END confusion,
                
               CASE WHEN survived = 1 THEN 58613 -- total survivors
                    WHEN survived = 0 THEN 105087 -- total fatalities
               END total
FROM
   ML.PREDICT(MODEL `bqml_nhtsa_2015`,
      (SELECT * FROM `bqml_nhtsa_view_2016`),
      STRUCT(0.2806      AS threshold))
 )
 GROUP BY confusion;
