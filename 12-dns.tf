data "google_dns_managed_zone" "existing" {
  project = var.project_id
  name    = var.existing_dns_zone_name
}

resource "google_dns_record_set" "app" {
  project      = var.project_id
  name         = "${var.domain}."
  managed_zone = data.google_dns_managed_zone.existing.name
  type         = "A"
  ttl          = var.dns_ttl
  rrdatas      = [google_compute_global_address.lb_ip.address]
}