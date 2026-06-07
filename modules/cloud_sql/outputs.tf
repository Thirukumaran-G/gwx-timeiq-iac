output "connection_name" {
  description = "Cloud SQL instance connection name in the form PROJECT:REGION:INSTANCE."
  value       = google_sql_database_instance.pg.connection_name
}

output "private_ip" {
  description = "Private IP address of the Cloud SQL instance within the VPC."
  value       = google_sql_database_instance.pg.private_ip_address
}

output "db_password" {
  description = "Randomly generated database user password."
  value       = random_password.db.result
  sensitive   = true
}

output "instance_name" {
  description = "Short name of the Cloud SQL instance."
  value       = google_sql_database_instance.pg.name
}