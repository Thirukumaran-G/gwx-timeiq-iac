resource "google_compute_subnetwork" "subnet" {
  project                  = var.project_id
  name                     = var.subnet_name
  ip_cidr_range            = var.cidr
  region                   = var.region
  network                  = var.vpc_name
  # private_ip_google_access = true
}