terraform {
  backend "gcs" {
    bucket      = "nh-ex-tf-state"
    prefix      = "terraform/state"
    credentials = "./tf-gke-keyfile.json"
  }
}

