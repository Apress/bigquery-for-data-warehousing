SELECT * 
FROM EXTERNAL_QUERY("projectID.US.connectionID", 
                    "SELECT * FROM INFORMATION_SCHEMA.TABLES";);