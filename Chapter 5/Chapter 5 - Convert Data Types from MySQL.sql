-- This is a MySQL query! It will not work on BigQuery!
SELECT CONCAT('[', GROUP_CONCAT(field SEPARATOR ', '), ']') FROM 
(SELECT JSON_UNQUOTE(JSON_OBJECT('name', COLUMN_NAME, 
                                 'mode', CASE IS_NULLABLE WHEN 'YES' THEN 'NULLABLE' ELSE 'REQUIRED' END,
                                 'type', CASE DATA_TYPE
                                        WHEN 'TINYINT' THEN 'INT64'
                                        WHEN 'SMALLINT' THEN 'INT64'
                                        WHEN 'MEDIUMINT' THEN 'INT64'
                                        WHEN 'LARGEINT' THEN 'INT64'
                                        WHEN 'BIGINT' THEN 'INT64'
                                        WHEN 'DECIMAL' THEN 'NUMERIC'
                                        WHEN 'FLOAT' THEN 'FLOAT64'
                                        WHEN 'DOUBLE' THEN 'FLOAT64'
                                        WHEN 'CHAR' THEN 'STRING'
                                        WHEN 'VARCHAR' THEN 'STRING'
                                        WHEN 'TINYTEXT' THEN 'STRING'
                                        WHEN 'TEXT' THEN 'STRING'
                                        WHEN 'MEDIUMTEXT' THEN 'STRING'
                                        WHEN 'LONGTEXT' THEN 'STRING'
                                        WHEN 'BINARY' THEN 'BYTES'
                                        WHEN 'VARBINARY' THEN 'BYTES'
                                        WHEN 'DATE' THEN 'DATE'
                                        WHEN 'TIME' THEN 'TIME'
                                        WHEN 'DATETIME' THEN 'DATETIME'
                                        WHEN 'TIMESTAMP' THEN 'TIMESTAMP'
                                        ELSE '!!UNKNOWN!!'
                                        END )) field
FROM INFORMATION_SCHEMA.COLUMNS 
WHERE TABLE_NAME='gpa'
ORDER BY ORDINAL_POSITION) R;
