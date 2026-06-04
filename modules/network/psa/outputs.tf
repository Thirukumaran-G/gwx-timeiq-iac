output "psa_range_name" {
  description = "Name of the reserved global address range used for Private Service Access. Passed to the cloud_sql module as allocated_ip_range so Cloud SQL instances are assigned private IPs from this dedicated range rather than from the main subnet, keeping address spaces cleanly separated."
  value       = google_compute_global_address.psa_range.name
}

output "psa_id" {
  description = "Resource ID of the service networking peering connection. Used only as a depends_on target in the cloud_sql and redis root module calls to ensure the peering connection is fully established before any private-IP database or cache instance is provisioned."
  value       = google_service_networking_connection.psa.id
}