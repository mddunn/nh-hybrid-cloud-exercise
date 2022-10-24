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

variable "zones" {
  type = list(string)
  description = "The zones to create the cluster"
}

variable "name" {
  type = string
  description = "The name of the cluster"
}

variable "machine_type" {
  type = string
  description = "The type of the node compute engines"
}

variable "min_count" {
  type = number
  description = "Minimum number of nodes in the NodePool. Must be >= 0 and <= max_count"
}

variable "max_count" {
  type = number
  description = "Maximum number of nodes in the NodePool. Must be >= min_count"
}

variable "disk_size_gb" {
  type = number
  description = "Size of the node's disk"
}

variable "service_account" {
  type = string
  description = "The service account to run nodes as if not overridden in `node_pools`. The create_service_account variable default value (true) will cause a cluster-specific service account to be created"
}

variable "initial_node_count" {
  type = number
  description = "The number of nodes to create in this cluster's default node pool"
}