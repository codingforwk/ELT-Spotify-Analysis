import pandas as pd
import pyarrow as pa
import pyarrow.parquet as pq
from google.cloud import storage, bigquery
import os
from io import BytesIO

# Set Google Cloud credentials
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = "terraform/keys/my-creds.json"

# File paths and GCP configs
local_csv_path = "data/dataset.csv"
gcs_bucket_name = "spotify_bucket-457217"
gcs_parquet_path = "raw/dataset.parquet"
bq_dataset = "spotify_dataset"
bq_table = "spotify_songs"

# Load CSV
df = pd.read_csv(local_csv_path)
print("✅ Successfully loaded CSV")

# Convert to Parquet in memory
table = pa.Table.from_pandas(df)
parquet_buffer = BytesIO()
pq.write_table(table, parquet_buffer)
parquet_buffer.seek(0)
print("✅ Successfully converted CSV to Parquet in memory")

# Upload Parquet to GCS
storage_client = storage.Client()
bucket = storage_client.bucket(gcs_bucket_name)
blob = bucket.blob(gcs_parquet_path)
blob.upload_from_file(parquet_buffer, content_type="application/octet-stream")
print("✅ Successfully uploaded Parquet file to GCS")

# Load to BigQuery
bq_client = bigquery.Client()
job_config = bigquery.LoadJobConfig(
    source_format=bigquery.SourceFormat.PARQUET,
    autodetect=True,
    write_disposition="WRITE_TRUNCATE"
)

uri = f"gs://{gcs_bucket_name}/{gcs_parquet_path}"
load_job = bq_client.load_table_from_uri(uri, f"{bq_dataset}.{bq_table}", job_config=job_config)
load_job.result()
print("✅ Successfully loaded data into BigQuery")
