PROJECT_ID = ‘YOUR-PROJECT-ID’
from google.cloud import automl_v1beta1 as automl
client = automl.TablesClient(project=PROJECT_ID)
datasetURI = 'bq://bigquery-public-data.iowa_liquor_sales.sales'
displayName = 'iowa_liquor_sales'
client.create_dataset(dataset_display_name=displayName)
response = client.import_data(dataset_display_name=displayName,
                             bigquery_input_uri=datasetURI)

client.set_target_column(
    dataset=dataset,
    column_spec_display_name=’volume_sold_liters’
)


# Caution: make sure you set the training budget! 
# The property for this is train_budget_milli_node_hours, 
# which specifies the number of millihours/node you want 
# training to last. For an example run, I wouldn’t exceed 
# 2000 millihours/node (2 hours) even if it degrades 
# the model results. 
response = client.create_model(
    MODEL_DISPLAY_NAME,
    dataset_display_name=’iowa-liquor-model’,
    train_budget_milli_node_hours=2000,
    exclude_column_spec_names=[ volume_sold_liters ],
)

