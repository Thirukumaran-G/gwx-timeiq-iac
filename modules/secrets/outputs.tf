output "db_url_secret_name" {
  description = "Secret Manager secret ID for the DATABASE_URL secret, which contains the full asyncpg connection string including host, user, password, and database name. Passed to the cloud_run module and mounted as the DATABASE_URL environment variable in the Cloud Run container via secret_key_ref so the password is never embedded in the container image or Terraform state in plaintext."
  value       = google_secret_manager_secret.db_url.secret_id
}

output "secret_key_name" {
  description = "Secret Manager secret ID for the application SECRET_KEY, a randomly generated 64-character string used by FastAPI for signing tokens or session data. Passed to the cloud_run module and mounted as the SECRET_KEY environment variable via secret_key_ref."
  value       = google_secret_manager_secret.secret_key.secret_id
}

output "secret_ids" {
  description = "List of fully qualified Secret Manager secret resource IDs for both db_url and secret_key. Used in the post-bootstrap gcloud command that grants the backend runtime SA roles/secretmanager.secretAccessor on each secret individually, ensuring the Cloud Run service identity can read secret versions at startup without holding project-wide secret access."
  value = [
    google_secret_manager_secret.db_url.id,
    google_secret_manager_secret.secret_key.id,
  ]
}