output "connector_id" {
  description = "Full resource ID of the Serverless VPC Access connector. Passed to the cloud_run module and set on the Cloud Run service vpc_access block so the backend service can reach private VPC resources such as Cloud SQL and Redis without traversing the public internet."
  value       = google_vpc_access_connector.connector.id
}

output "connector_name" {
  description = "Short name of the Serverless VPC Access connector. Available for logging, monitoring filters, or any future resource that needs to reference the connector by name rather than full ID."
  value       = google_vpc_access_connector.connector.name
}