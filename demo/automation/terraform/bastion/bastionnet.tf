# Create the bastionnet network
resource "google_compute_network" "bastion" {
  name                    = "bastionnet"
  auto_create_subnetworks = "false"
}

# Create bastionnet-eu-public subnetwork
resource "google_compute_subnetwork" "bastion-public" {
  name          = "bastionnet-eu-public"
  region        = "europe-west1"
  network       = google_compute_network.bastion.self_link
  ip_cidr_range = "10.130.0.0/20"
}

# Create bastionnet-eu-private subnetwork
resource "google_compute_subnetwork" "bastion-private" {
  name          = "bastionnet-eu-private"
  region        = "europe-west1"
  network       = google_compute_network.bastion.self_link
  ip_cidr_range = "10.131.0.0/20"
}

# Add a firewall rule to allow SSH traffic on bastionnet for a specific tag
resource "google_compute_firewall" "bastionnet-bastion-ssh" {
  name    = "bastionnet-allow-ssh-bastion"
  network = google_compute_network.bastion.self_link

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "icmp"
  }

  target_tags = ["bastion-host"]
}

# Add a firewall rule to allow all internal traffic on bastionnet for all instances in the network
resource "google_compute_firewall" "bastionnet-allow-internal" {
  name    = "bastionnet-allow-internal"
  network = google_compute_network.bastion.self_link

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = [
    "10.130.0.0/15"
  ]
}

# Add the bastion instance
module "bastion-vm" {
  source              = "./instance"
  instance_name       = "bastion"
  instance_zone       = "europe-west1-d"
  instance_subnetwork = google_compute_subnetwork.bastion-public.self_link

  network-tags = [
    "bastion-host"
  ]
}

# Add the private instance
module "private-vm" {
  source              = "./instance"
  instance_name       = "private"
  instance_zone       = "europe-west1-d"
  instance_subnetwork = google_compute_subnetwork.bastion-public.self_link

  avoid-external-ip = true

  network-tags = [
    "private-host"
  ]
}

# Cloud NAT
resource "google_compute_address" "nat-ip" {
  name    = "nat-ip"
  region  = "europe-west1"
}
resource "google_compute_router" "nat-router" {
  name = "bastion-nat-router"
  region  = "europe-west1"
  network = "${google_compute_network.bastion.self_link}"
}
resource "google_compute_router_nat" "nat-server" {
  name = "bast-nat-gw"
  region  = "europe-west1"
  router = "${google_compute_router.nat-router.name}"
  nat_ip_allocate_option = "MANUAL_ONLY"
  nat_ips = ["${google_compute_address.nat-ip.self_link}"]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  depends_on = ["google_compute_address.nat-ip"]
}