resource "google_compute_network" "terra_vpc" {
  project                 = var.project_id
  name                    = var.vpc_name
  auto_create_subnetworks = false
  description = "This vpc was created using Terraform"
  delete_default_routes_on_create = false #if enabled route (0.0.0.0/0) is deleted immediately after network creation.
}