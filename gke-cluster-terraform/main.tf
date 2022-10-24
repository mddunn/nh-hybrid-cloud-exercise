terraform {
  backend "gcs" {
    #bucket      = "<your-gcs-bucket-name>"
    bucket      = "dunn-nh-ex-gcs"
    prefix      = "terraform/state"
    credentials = "./tf-gke-keyfile.json"
  }
}

