resource "google_container_cluster" "my_cluster" {
  name     = "my-gke-cluster"
  location = "europe-west2-a" # Zonal Cluster/ single zone
  # Terraform:
  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = module.network.vpc_name
  subnetwork               = module.network.restricted_subnet_name

  addons_config {
    http_load_balancing {
      disabled = false # enable only if you using custom ingress controller
    }
  }
  # update GKE Cluster only if there's stable updaete
  release_channel {
    channel = "STABLE"
  }

  private_cluster_config {
    # creating a private endpoints on the cluster.
    enable_private_nodes = true
    # to only connext to gke from private endpoint ex: bastion server
    enable_private_endpoint = true
    # cidr will be assigned to the master (control plane) control plane
    master_ipv4_cidr_block = "172.16.0.0/28"
  }
  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = "10.0.1.0/24"

      display_name = "managed-subnet-only-acces"
    }
  }
  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "192.168.0.0/16"
    services_ipv4_cidr_block = "10.96.0.0/16"
  }
}


resource "google_container_node_pool" "mycluster_nodes" {
  name       = "my-node-pool"
  location   = "europe-west2-a"
  cluster    = google_container_cluster.my_cluster.name
  node_count = 1

  node_config {
    preemptible  = false # if enabled: type of vms that last up to 24 hours after creation.
    machine_type = "e2-small"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.kubernetes_service_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
