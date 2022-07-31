# -------------------- Bastion server SA----------------------
resource "google_service_account" "bastion_service_account" {
  account_id   = var.sa_id
  display_name = var.sa_Dname
}


resource "google_project_iam_binding" "sa_binding" {
  project = var.project_id
  role    = "roles/container.admin" # Full access to kubernertes cluster
  members = [
    "serviceAccount:${google_service_account.bastion_service_account.email}"
  ]
}
# --------------------  Kubernetes SA ----------------------
resource "google_service_account" "kubernetes_service_account" {
  account_id   = "kubernetes-sa"
  display_name = "Kubernetes SA"
}


resource "google_project_iam_binding" "gke_sa_binding" {
  project = var.project_id
  role    = "roles/storage.admin" # Full access to kubernertes cluster
  members = [
    "serviceAccount:${google_service_account.kubernetes_service_account.email}"
  ]
}
