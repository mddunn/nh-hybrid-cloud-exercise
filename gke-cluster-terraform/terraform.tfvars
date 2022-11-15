#credentials = "/path/to/keyfile"
credentials = "/Users/mdunn/Desktop/Workspaces/Professional-Services/nh-hybrid-cloud-exercise/gke-cluster-terraform/tf-gke-keyfile.json"

project_id = "solutionsarchitect-01"

#region = "<REGION>"
region = "us-west1"

#zones = "[ZONE_LIST]"
zones = ["us-west1-a","us-west1-b","us-west1-c"]

#name = "<YOUR-NAME>-nh-ex-cluster"
name = "dunn-nh-ex-cluster"

machine_type = "e2-standard-4"

min_count = 1

max_count = 3

disk_size_gb = 10

#service_account = "<SERVICE-ACCOUNT>"
service_account = "dunn-nh-ex-sa@solutionsarchitect-01.iam.gserviceaccount.com"

initial_node_count = 1