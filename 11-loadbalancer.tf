resource "google_compute_security_policy" "armor" {
  project     = var.project_id
  name        = local.armor_name
  description = "WAF policy for ${local.env}"

  rule {
    action   = "allow"
    priority = 1000
    match {
      expr { expression = "evaluatePreconfiguredExpr('xss-stable')" }
    }
    preview = true
  }

  rule {
    action   = "allow"
    priority = 1001
    match {
      expr { expression = "evaluatePreconfiguredExpr('sqli-stable')" }
    }
    preview = true
  }

  rule {
    action   = "throttle"
    priority = 1002
    match {
      expr { expression = "true" }
    }
    rate_limit_options {
      conform_action = "allow"
      exceed_action  = "deny(429)"
      enforce_on_key = "IP"
      rate_limit_threshold {
        count        = var.rate_limit_count
        interval_sec = var.rate_limit_interval_sec
      }
    }
  }

  rule {
    action   = "allow"
    priority = 2147483647
    match {
      versioned_expr = "SRC_IPS_V1"
      config { src_ip_ranges = ["*"] }
    }
  }
}

resource "google_compute_managed_ssl_certificate" "main" {
  project = var.project_id
  name    = "${local.lb_name}-ssl"
  managed { domains = [var.domain] }
}

resource "google_compute_region_network_endpoint_group" "api_neg" {
  project               = var.project_id
  name                  = "${local.lb_name}-api-neg"
  network_endpoint_type = "SERVERLESS"
  region                = var.region
  cloud_run { service = module.backend.service_name }
  depends_on = [module.backend]
}

resource "google_compute_backend_service" "api" {
  project     = var.project_id
  name        = "${local.lb_name}-api-bs"
  protocol    = "HTTPS"
  timeout_sec = var.lb_timeout_sec

  security_policy = google_compute_security_policy.armor.id

  backend { group = google_compute_region_network_endpoint_group.api_neg.id }
}

resource "google_compute_backend_bucket" "frontend" {
  project     = var.project_id
  name        = "${local.lb_name}-fe-bb"
  bucket_name = module.storage.frontend_bucket_name
  enable_cdn  = true

  cdn_policy {
    cache_mode       = "CACHE_ALL_STATIC"
    default_ttl      = var.cdn_default_ttl
    max_ttl          = var.cdn_max_ttl
    client_ttl       = var.cdn_default_ttl
    negative_caching = true
  }
}

resource "google_compute_url_map" "main" {
  project         = var.project_id
  name            = local.lb_name
  default_service = google_compute_backend_bucket.frontend.id

  host_rule {
    hosts        = [var.domain]
    path_matcher = "paths"
  }

  path_matcher {
    name            = "paths"
    default_service = google_compute_backend_bucket.frontend.id

    path_rule {
      paths   = ["/api", "/api/*"]
      service = google_compute_backend_service.api.id
    }
  }
}

resource "google_compute_url_map" "http_redirect" {
  project = var.project_id
  name    = "${local.lb_name}-http-redirect"

  default_url_redirect {
    https_redirect         = true
    redirect_response_code = "MOVED_PERMANENTLY_DEFAULT"
    strip_query            = false
  }
}

resource "google_compute_target_http_proxy" "redirect" {
  project = var.project_id
  name    = "${local.lb_name}-http-proxy"
  url_map = google_compute_url_map.http_redirect.id
}

resource "google_compute_target_https_proxy" "main" {
  project          = var.project_id
  name             = "${local.lb_name}-https-proxy"
  url_map          = google_compute_url_map.main.id
  ssl_certificates = [google_compute_managed_ssl_certificate.main.id]
}

resource "google_compute_global_address" "lb_ip" {
  project = var.project_id
  name    = "${local.lb_name}-ip"
}

resource "google_compute_global_forwarding_rule" "https" {
  project    = var.project_id
  name       = "${local.lb_name}-https"
  target     = google_compute_target_https_proxy.main.id
  ip_address = google_compute_global_address.lb_ip.address
  port_range = "443"
}

resource "google_compute_global_forwarding_rule" "http" {
  project    = var.project_id
  name       = "${local.lb_name}-http"
  target     = google_compute_target_http_proxy.redirect.id
  ip_address = google_compute_global_address.lb_ip.address
  port_range = "80"
}

resource "google_cloud_run_v2_service_iam_member" "public" {
  project  = var.project_id
  location = var.region
  name     = module.backend.service_name
  role     = "roles/run.invoker"
  member   = "allUsers"

  depends_on = [module.backend]
}