resource "google_compute_subnetwork" "managed-subnet" {
  name          = "management-subnet"
  ip_cidr_range = var.managed_subnet_CIDR
  region        = var.managed_subnet_region
  network       = google_compute_network.terra_vpc.id # add your vpc id
  description   = "This subnet was created by Terraform"
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "restricted-subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = var.restricted_subnet_CIDR
  region        = var.restricted_subnet_region
  network       = google_compute_network.terra_vpc.id
  description   = "This subnet was created by Terraform"
  private_ip_google_access = true
}
