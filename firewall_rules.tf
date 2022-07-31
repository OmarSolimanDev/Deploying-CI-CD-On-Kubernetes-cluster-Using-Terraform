resource "google_compute_firewall" "ssh-rule" {
  project   = var.project_id
  name      = "allow-ssh-traffic"
  network   = module.network.vpc_name
  direction = "INGRESS" # Inbound traffic
  priority = "1000"
  allow {
    protocol = "tcp"
    ports    = ["22"] # Allowing ssh port to acces the internet
  }
  source_ranges = ["35.235.240.0/20"] # only allow the IAP access
  target_tags   = ["bastion"]
}
