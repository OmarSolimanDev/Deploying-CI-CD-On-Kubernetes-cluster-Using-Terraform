resource "google_compute_router" "cloud_router" {
  name    = var.router_name
  region  = var.router_region
  network = google_compute_network.terra_vpc.id
}

resource "google_compute_router_nat" "nat" {
  name                               = var.nat_name
  router                             = google_compute_router.cloud_router.name
  region                             = google_compute_router.cloud_router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
