output "connection_name" {
  description = "Cloud SQL instance connection name in the form PROJECT:REGION:INSTANCE. Passed to the secrets module to construct the DATABASE_URL secret value in the format postgresql+asyncpg://USER:PASS@/cloudsql/CONNECTION_NAME/DBNAME, which the Cloud Run backend reads at runtime to connect to the database over the Cloud SQL Auth Proxy socket."
  value       = google_sql_database_instance.pg.connection_name
}

output "private_ip" {
  description = "Private IP address of the Cloud SQL instance within the VPC. Not consumed by any other module in the current setup but surfaced for direct psql access from a bastion or Cloud Shell session during development and debugging."
  value       = google_sql_database_instance.pg.private_ip_address
}

output "db_password" {
  description = "Randomly generated database user password. Marked sensitive so Terraform redacts it from plan and apply output. Passed to the secrets module which embeds it in the DATABASE_URL secret stored in Secret Manager; the raw value is never written to any config file or environment variable."
  value       = random_password.db.result
  sensitive   = true
}

output "instance_name" {
  description = "Short name of the Cloud SQL instance. Surfaced for use in gcloud sql commands during maintenance, manual backup verification, or point-in-time recovery operations."
  value       = google_sql_database_instance.pg.name
}