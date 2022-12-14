module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.project_id
  name                       = var.name
  region                     = var.region
  zones                      = var.zones
  network                    = "default"
  subnetwork                 = "default"
  ip_range_pods              = ""
  ip_range_services          = ""
  http_load_balancing        = false
  network_policy             = true
  remove_default_node_pool   = true

  node_pools = [
    {
      name               = "my-node-pool"
      machine_type       = var.machine_type
      node_locations     = join(",", var.zones)  // "ex. europe-west2-a,europe-west2-b,europe-west2-c"
      min_count          = var.min_count
      max_count          = var.max_count
      # local_ssd_count    = 1
      # disk_type          = "pd-standard"
      # image_type         = "COS_CONTAINERD"
      disk_size_gb       = var.disk_size_gb
      auto_repair        = true
      auto_upgrade       = true
      service_account    = var.service_account
      preemptible        = false
      initial_node_count = var.initial_node_count
    }
  ]

  # node_pools_oauth_scopes = {
  #   all = []

  #   default-node-pool = [
  #     "https://www.googleapis.com/auth/cloud-platform",
  #   ]
  # }

  # node_pools_labels = {
  #   all = {}

  #   default-node-pool = {
  #     default-node-pool = true
  #   }
  # }

  # node_pools_metadata = {
  #   all = {}

  #   default-node-pool = {
  #     node-pool-metadata-custom-value = "my-node-pool"
  #   }
  # }

  # node_pools_taints = {
  #   all = []

  #   default-node-pool = [
  #     {
  #       key    = "default-node-pool"
  #       value  = true
  #       effect = "PREFER_NO_SCHEDULE"
  #     },
  #   ]
  # }

  # node_pools_tags = {
  #   all = []

  #   default-node-pool = [
  #     "default-node-pool",
  #   ]
  # }
}
