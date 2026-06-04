output "router_name" {
  description = "Name of the Cloud Router that the NAT gateway is attached to. Surfaced for observability and for any future BGP or additional NAT configuration that references the same router."
  value       = google_compute_router.router.name
}

output "nat_name" {
  description = "Name of the Cloud NAT gateway. Surfaced for monitoring dashboards and log-based alert filters that need to identify NAT translation events or dropped packets for this specific gateway."
  value       = google_compute_router_nat.nat.name
}