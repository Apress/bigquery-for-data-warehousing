CREATE TABLE dataset.gpa_table_temp
 (LastName STRING NOT NULL,
  FirstName STRING NOT NULL,
  GPA NUMERIC,
  EnrollmentDate DATE NOT NULL,
  ExpectedGraduationYear INT64 NOT NULL)
AS
SELECT 
string_field_0,
string_field_1,
SAFE_CAST(int64_field_2 AS NUMERIC),
date_field_3,
EXTRACT(YEAR FROM date_field_3) + 4
FROM dataset.gpa_table
