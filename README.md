# ELT-Spotify-Analysis

# 🎵 Spotify Analytics Pipeline

**Problem Solved**: Identify high-potential artists and genres by analyzing Spotify track data (popularity, danceability, energy).  

# 🔨 End-to-End Data Pipeline Architecture
![project arc](https://github.com/user-attachments/assets/7ea14a52-730c-4d03-a273-8fcc8b1ce008)



## 🛠️ Technologies Used
| Tool          | Purpose                          |
|---------------|----------------------------------|
| **Terraform** | GCP infrastructure (BigQuery, GCS) |
| **Python**    | Data loading from CSV to BigQuery |
| **dbt**       | Transform raw data into analytics-ready models |
| **Looker Studio** | Visualization                  |

## 📊 Live Dashboard
[![Dashboard Preview](https://i.imgur.com/Jr6q3Yl.png)](https://lookerstudio.google.com/embed/reporting/1042d64e-3b81-4f45-b49f-1373c1d5b3eb/page/ZRXHF)

## 🚀 Reproduction Steps

### **Prerequisites**
- Docker + Docker Compose
- GCP Service Account Key (`terraform/keys/service-account.json`)

### **1. Run the Pipeline**
```bash
docker-compose up
