from flask import Flask
from flask import request
from google.cloud import bigquery

app = Flask(__name__)

# define your project.dataset.table here
table_id = 'bort-qaliwo.wbq.stream'

# define number of repetitions you want
count = 1000

# you can modify the schema if you wish
schema = [
    bigquery.SchemaField("streamed_data", "STRING", mode="REQUIRED")
]

# define the root page
@app.route("/form")
def index():
    return app.send_static_file('index.html')

# define the behavior for loading the stream
@app.route("/stream", methods = ['POST'])
def stream():

    if "s" in request.form:
        s = request.form.get('s')
    else:
        return "No string passed!"

    client = bigquery.Client()

    table = bigquery.Table(table_id, schema=schema)

    # the true ensures you will not get errors on subsequent runs of the script
    # when the table already exists
    table = client.create_table(table, True)

   rows_to_insert = [{"streamed_data" : s+str(i)} for i in range(count)]

    errors = client.insert_rows(table, rows_to_insert)
    if errors == []:
        return "Successfully streamed! Check your table."
    else:
        return errors

if __name__ == "__main__":
    app.run(debug=True)
