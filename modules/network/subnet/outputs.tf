output "subnet_name" {
  description = "Name of the subnetwork. Used by the nat module to restrict Cloud NAT to translate only traffic originating from this specific subnet, rather than all subnets in the VPC."
  value       = google_compute_subnetwork.subnet.name
}

output "subnet_self_link" {
  description = "Self-link URI of the subnetwork. Available for reference by any resource that needs to place workloads directly into this subnet, such as a GCE instance or a regional managed instance group."
  value       = google_compute_subnetwork.subnet.self_link
}

output "subnet_cidr" {
  description = "Primary CIDR range of the subnetwork, e.g. 10.0.0.0/24. Surfaced so the root config can pass it to the firewall module as the internal_cidr value, allowing the allow-internal firewall rule to permit traffic between all hosts on this subnet."
  value       = google_compute_subnetwork.subnet.ip_cidr_range
}