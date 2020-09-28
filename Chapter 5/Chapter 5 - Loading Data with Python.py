# Load BigQuery from the Python GCP Library
from google.cloud import bigquery

# Load a performance timer (optional or comment out)
from timeit import default_timer as timer

# Specify your fully-qualified table name as you would in the UI
import_table = 'YOUR-DATASET.bortdata.bookdata'

# Choose the GCS bucket and file, or override it with a full gs:// URI
gcs_bucket = 'YOUR-BUCKET'
gcs_file = 'book-data.csv'

# gs://mybucket/book-data.csv OR local file ./book-data.csv
location = ''
# location = 'gs://YOUR-BUCKET/book-data.csv'
# location = './book-data.csv'

# Load the references to the table for import
[project_name, dataset_name, table_name] = import_table.split('.')
client = bigquery.Client(project_name)
dataset = client.dataset(dataset_name)
table = dataset.table(table_name)

# Create the configuration and specify the schema
config = bigquery.LoadJobConfig()
config.schema = [
    bigquery.SchemaField("Author", "STRING"),
    bigquery.SchemaField("Title", "STRING"),
    bigquery.SchemaField("LexicalDiversity", "FLOAT")
]

# If you have a header row
config.skip_leading_rows = 1

# Uncomment to change import file type
# config.source_format = bigquery.SourceFormat.CSV

# Uncomment and remove config.schema to autodetect schema
# config.autodetect = True

# Default to GCS
local = False
gcs_uri = ''

# Format the GCS URI or use the pre-supplied one above
if (len(location) == 0):
    gcs_uri = "gs://{}/{}".format(gcs_bucket, gcs_file)
elif not (location.startswith('gs://')):
    local = True
else:
    gcs_uri = location

# Create the job definition
if (local):
    with open(location, "rb") as file:
        job = client.load_table_from_file(file, table, job_config=config)
else:
    job = client.load_table_from_uri(gcs_uri, table, job_config=config)

print ("Loading {} file {} into dataset {} as table {}...".format \
      (("local" if local else "GCS"),(location if local else gcs_uri), dataset_name, table_name))

# See if we have a timer
try:
    timer
    use_timer = True
except NameError:
    use_timer = False

if (use_timer):
    start = timer()

# Performs the load and waits for result
job.result()

if (use_timer):
    end = timer()
    result_time = " in {0:.4f}s".format(end-start)
else:
    result_time = ""


# Prints results
print("{} rows were loaded{}.".format(job.output_rows, result_time))
