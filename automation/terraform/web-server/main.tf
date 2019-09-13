# Configure the Google Cloud provider
provider "google" {
  credentials = "${file(var.service_account_path)}"
  project = "${var.project_id}"
  region  = "${var.gcp_zone}"
}

# Create a Google Compute Firewall
resource "google_compute_firewall" "instance" {
  name    = "terraform-example-instance"
  network = "default"

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }
}

# Create a Google Compute instance
resource "google_compute_instance" "example" {
  name          = "example"
  machine_type  = "g1-small"
  zone          = "${var.gcp_zone}"
  allow_stopping_for_update = true
  
  boot_disk {
    initialize_params {
      image = "ubuntu-1604-lts"
    }
  }
  
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
  
  tags = ["terraform-example"]
  
  metadata_startup_script = "echo 'Hello, World' > index.html ; nohup busybox httpd -f -p 8080 &"
}

# Output variable: Public IP address
output "public_ip" {
  value = "${google_compute_instance.example.network_interface.0.access_config.0.assigned_nat_ip}"
}