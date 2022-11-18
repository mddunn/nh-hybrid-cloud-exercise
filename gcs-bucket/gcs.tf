resource "google_storage_bucket" "gcs" {
  name = var.bucket_name
  storage_class = var.storage_class
  location = var.region
}