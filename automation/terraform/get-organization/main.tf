# Configure the Google Cloud provider
provider "google" {
  credentials = "${file(var.service_account_path)}"
}

data "google_organization" "org" {
  domain = "${var.org_domain}"
}

output "organization_id" {
    value = "${data.google_organization.org.id}"
}