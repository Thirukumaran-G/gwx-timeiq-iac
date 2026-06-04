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
  secret_data = "${var.db_driver}://${var.db_user}:${var.db_password}@/cloudsql/${var.db_connection_name}/${var.db_name}"
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