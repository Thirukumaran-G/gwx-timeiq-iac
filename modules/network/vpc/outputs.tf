output "vpc_name" {
  description = "Name of the VPC network. Used by subnet, firewall, connector, and nat modules as the network reference when creating child resources inside this VPC."
  value       = google_compute_network.vpc.name
}

output "vpc_self_link" {
  description = "Self-link URI of the VPC network. Used by psa module to create the private service access peering range, by cloud_sql and redis modules to attach instances to this VPC via private IP, and by the nat module router."
  value       = google_compute_network.vpc.self_link
}

output "vpc_id" {
  description = "Unique resource ID of the VPC network. Available for reference if any future module or root resource needs to express a dependency on the VPC by ID rather than name or self-link."
  value       = google_compute_network.vpc.id
}