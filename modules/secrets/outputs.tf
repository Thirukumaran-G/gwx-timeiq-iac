output "db_url_secret_name" {
  value = google_secret_manager_secret.db_url.secret_id
}

output "db_password_secret_name" {
  value = google_secret_manager_secret.db_password.secret_id
}

output "secret_key_name" {
  value = google_secret_manager_secret.secret_key.secret_id
}

output "redis_addr_secret_name" {
  value = google_secret_manager_secret.redis_addr.secret_id
}

output "gemini_api_key_secret_name" {
  value = google_secret_manager_secret.gemini_api_key.secret_id
}

output "secret_ids" {
  description = "All secret resource IDs for IAM binding"
  value = [
    google_secret_manager_secret.db_url.id,
    google_secret_manager_secret.db_password.id,
    google_secret_manager_secret.secret_key.id,
    google_secret_manager_secret.redis_addr.id,
    google_secret_manager_secret.gemini_api_key.id,
  ]
}