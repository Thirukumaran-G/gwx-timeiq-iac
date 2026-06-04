resource "google_compute_firewall" "deny_all_ingress" {
  project   = var.project_id
  name      = "${var.vpc_name}-deny-all-ingress"
  network   = var.vpc_name
  direction = "INGRESS"
  priority  = var.deny_all_priority

  deny { protocol = "all" }
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_internal" {
  project   = var.project_id
  name      = "${var.vpc_name}-allow-internal"
  network   = var.vpc_name
  direction = "INGRESS"
  priority  = var.internal_priority

  allow { protocol = "tcp" }
  allow { protocol = "udp" }
  allow { protocol = "icmp" }
  source_ranges = [var.internal_cidr]
}

resource "google_compute_firewall" "allow_health_checks" {
  project   = var.project_id
  name      = "${var.vpc_name}-allow-hc"
  network   = var.vpc_name
  direction = "INGRESS"
  priority  = var.health_check_priority

  allow {
    protocol = "tcp"
    ports    = var.health_check_ports
  }
  source_ranges = var.health_check_ranges
}

resource "google_compute_firewall" "allow_iap" {
  project   = var.project_id
  name      = "${var.vpc_name}-allow-iap"
  network   = var.vpc_name
  direction = "INGRESS"
  priority  = var.iap_priority

  allow {
    protocol = "tcp"
    ports    = var.iap_ports
  }
  source_ranges = [var.iap_cidr]
}