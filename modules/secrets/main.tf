resource "random_password" "app_secret" {
  length  = var.secret_key_length
  special = false
}

resource "google_secret_manager_secret" "db_url" {
  project   = var.project_id
  secret_id = "${var.prefix}-db-url-${var.env}"
  labels    = var.labels
  replication { 
    auto {} 
  }
}

resource "google_secret_manager_secret_version" "db_url" {
  secret      = google_secret_manager_secret.db_url.id
  secret_data = "${var.db_driver}://${var.db_user}:${var.db_password}@${var.db_host}:${var.db_port}/${var.db_name}"
}

resource "google_secret_manager_secret" "db_password" {
  project   = var.project_id
  secret_id = "${var.prefix}-db-password-${var.env}"
  labels    = var.labels
  replication { 
    auto {} 
    }
}

resource "google_secret_manager_secret_version" "db_password" {
  secret      = google_secret_manager_secret.db_password.id
  secret_data = var.db_password
}

resource "google_secret_manager_secret" "secret_key" {
  project   = var.project_id
  secret_id = "${var.prefix}-secret-key-${var.env}"
  labels    = var.labels
  replication { 
    auto {} 
  }
}

resource "google_secret_manager_secret_version" "secret_key" {
  secret      = google_secret_manager_secret.secret_key.id
  secret_data = random_password.app_secret.result
}

resource "google_secret_manager_secret" "redis_addr" {
  project   = var.project_id
  secret_id = "${var.prefix}-redis-addr-${var.env}"
  labels    = var.labels
  replication { 
    auto {} 
    }
}

resource "google_secret_manager_secret_version" "redis_addr" {
  secret      = google_secret_manager_secret.redis_addr.id
  secret_data = "${var.redis_host}:${var.redis_port}?ssl_cert_reqs=none"
}

resource "google_secret_manager_secret" "gemini_api_key" {
  project   = var.project_id
  secret_id = "${var.prefix}-gemini-api-key-${var.env}"
  labels    = var.labels
  replication { 
    auto {} 
    }
}

resource "google_secret_manager_secret_version" "gemini_api_key" {
  secret      = google_secret_manager_secret.gemini_api_key.id
  secret_data = var.gemini_api_key
}