# ELT-Spotify-Analysis

# 🎵 Spotify Analytics Pipeline

**Problem Solved**: Identify high-potential artists and genres by analyzing Spotify track data (popularity, danceability, energy).  

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

### **Prerequisites**
- Docker + Docker Compose
- GCP Service Account Key (`terraform/keys/service-account.json`)

### **1. Run the Pipeline**
```bash
docker-compose up
