provider "google" {
    credentials = "${file(var.service_account_path)}"
    region  = "europe-west1"
    zone    = "europe-west1-d"
}