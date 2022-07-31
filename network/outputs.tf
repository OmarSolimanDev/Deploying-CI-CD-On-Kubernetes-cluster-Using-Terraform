output "vpc_id" {
  value = google_compute_network.terra_vpc.id
}
output "vpc_name" {
  value = google_compute_network.terra_vpc.name
}

output "managed_subnet_name" {
  value = google_compute_subnetwork.managed-subnet.name
}
output "restricted_subnet_name" {
  value = google_compute_subnetwork.restricted-subnet.name
}

output "managed_subnet_id" {
  value = google_compute_subnetwork.managed-subnet.id
}
output "restricted_subnet_id" {
  value = google_compute_subnetwork.restricted-subnet.id
}
