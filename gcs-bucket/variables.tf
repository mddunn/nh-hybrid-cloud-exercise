variable "credentials" {
    type = string
    description = "Location of the credential keyfile"
}

variable "project_id" {
  type = string
  description = "The project ID to create the cluster"
}

variable "region" {
  type = string
  description = "The region to create the cluster"
}

variable "bucket_name" {
  type = string
  description = "The name of our bucket"
}

variable "storage_class" {
  type = string
}