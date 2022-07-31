resource "google_compute_instance" "bastion_host" {
  name         = "gke-bastion"
  machine_type = "e2-micro"
  zone         = "europe-west2-a"

  tags = ["managed-subnet", "bastion"]

  boot_disk {
    initialize_params {
      # cmd => `gcloud compute images list | grep ubuntu` 
      # TO list all available images.  
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
      size = 10
      type = "pd-standard" # disk type
    }
  }

  network_interface {
    network    = module.network.vpc_name
    subnetwork = module.network.managed_subnet_name
  }
  metadata_startup_script = file("startup_script.sh")

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.bastion_service_account.email
    scopes = ["cloud-platform"]
  }
}
