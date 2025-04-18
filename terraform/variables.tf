variable "credentials" {
  description = "My Credentials"
  default     = "./keys/my-creds.json"

}

variable "project" {
  description = "Project"
  default     = "spotify-project-457217"

}

variable "region" {
  description = "Region"
  default     = "EU"

}


variable "location" {
  description = "Project Location"
  default     = "EU"

}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "spotify_dataset"

}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "spotify_bucket-457217"

}


variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"

}