resource "google_dns_managed_zone" "main" {
  project     = var.project_id
  name        = local.dns_zone_name
  dns_name    = "${var.domain}."
  description = "Managed zone for ${var.domain}"
  labels      = local.common_labels
}

resource "google_dns_record_set" "root" {
  project      = var.project_id
  name         = "${var.domain}."
  managed_zone = google_dns_managed_zone.main.name
  type         = "A"
  ttl          = var.dns_ttl
  rrdatas      = [google_compute_global_address.lb_ip.address]
}