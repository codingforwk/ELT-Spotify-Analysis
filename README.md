# ELT-Spotify-Analysis
![image](https://github.com/user-attachments/assets/3102adac-f3fc-4eb3-9548-2b6cb8df52b9)


# 🎵 Spotify Analytics Pipeline

**Problem**: Spotify's streaming data provides rich insights into music preferences, but raw data alone doesn’t reveal trends. This project transforms raw track data into actionable analytics, identifying high-potential artists, genre performance, and commercial success drivers. 

# 🔨 End-to-End Data Pipeline Architecture
![project arc](https://github.com/user-attachments/assets/7ea14a52-730c-4d03-a273-8fcc8b1ce008)



## 🛠️ Technologies Used
| Tool          | Purpose                          |
|---------------|----------------------------------|
| **Terraform** | GCP infrastructure (BigQuery, GCS) |
| **Python**    | Data loading from CSV to Google Storage |
| **dbt**       | Transform raw data into analytics-ready models |
| **Looker Studio** | Visualization                  |
| **Docker** | Containerization                  |


## 📊 Dashboard
![image](https://github.com/user-attachments/assets/c0d04f67-618c-43d4-beaa-0125d67064c3)


## 🚀 Reproduction Steps

```markdown
## Prerequisites

Before using the project, ensure you have the following:

- Docker installed on your local machine.
- GCP credentials (saved as `my-creds.json`).
- Active Google Cloud project with access to BigQuery and GCS.
- (Optional) DBT Cloud for running DBT models.

## Setup Instructions

### 1. Clone the Project

Clone this repository to your local machine:

```bash
git clone <repository_url>
cd <project_directory>
```

### 2. Docker Setup

Ensure you have Docker installed and running on your machine.

#### 2.1 Build Docker Image

To build the Docker image for this project, use the following command in the project directory:

```bash
docker build -t spotify-loader .
```

#### 2.2 Run Docker Container

Run the Docker container, ensuring your local data and credentials are accessible:

```bash
docker run -v ./data:/app/data -v ./terraform/keys/my-creds.json:/app/my-creds.json spotify-loader
```

This command mounts the data/ folder and the credentials file into the container.

### 3. Docker Compose (Optional)

To use Docker Compose for easy container orchestration, use the following command:

```bash
docker-compose up --build
```

This will start the container and automatically mount the necessary directories.

### 4. Running the Data Loader Script

Once the container is running, it will automatically execute script.py. The script will:

- Load the CSV file from the data/ directory.
- Convert it to Parquet format in memory.
- Upload the Parquet file to Google Cloud Storage (GCS).
- Load the data from GCS into BigQuery for analysis.

### 5. DBT Models (Optional)

If you are using DBT for transforming the data, you can follow these steps to set up the DBT environment and run the transformations:

1. Connect DBT to BigQuery:
   - In DBT Cloud or locally, configure your profiles.yml to connect to your BigQuery project.

2. Run DBT Models:
   - Once connected, run the DBT models to transform your raw data into a structured dataset.

### 6. Logs and Debugging

You can check the logs in Docker by viewing the container logs:

```bash
docker logs spotify-loader
```

This will show any errors or success messages for your data load process.

### 7. Cleanup

To stop and remove the Docker container:

```bash
docker-compose down
```

## Notes

- This project assumes that your raw data CSV file (dataset.csv) is structured as expected and has been uploaded to the data/ folder.
- The my-creds.json should contain the GCP service account credentials for accessing BigQuery and GCS.
