CREATE OR REPLACE FUNCTION wbq.AddFiveJS(x FLOAT64)
RETURNS FLOAT64
LANGUAGE js AS """
  return x+5;
""";


CREATE TEMP FUNCTION externalLibraryJSFunction(x STRING)
  RETURNS STRING
  LANGUAGE js
  OPTIONS (library=["gs://some.js", ...])
  AS
""”
 return externalFunction(x);
""";
