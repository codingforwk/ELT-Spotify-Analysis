# Use official Python image
FROM python:3.12-slim

# Set working directory
WORKDIR /app

# Install required system dependencies
RUN apt-get update && apt-get install -y gcc

# Copy requirements and install them
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the script and data folder
COPY script.py .
COPY data/ ./data/
COPY terraform/keys/my-creds.json ./my-creds.json

# Set environment variable for GCP credentials
ENV GOOGLE_APPLICATION_CREDENTIALS="/app/my-creds.json"

# Default command to run the script
CMD ["python", "script.py"]
