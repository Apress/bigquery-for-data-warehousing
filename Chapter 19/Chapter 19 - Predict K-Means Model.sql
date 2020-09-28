  SELECT *
        FROM ML.PREDICT(
        MODEL metkmeans, (
                SELECT 'Painting' department,
                        1641 object_begin_date,
                        1641 object_end_date,
                        'Prints' classification,                        'Rembrandt van Rijn' artist_alpha_sort,             
            ))
