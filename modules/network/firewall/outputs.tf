output "deny_all_ingress_name" {
  description = "Name of the default-deny ingress firewall rule. Surfaced so monitoring or compliance tooling can verify by name that the baseline deny rule is present and has not been removed or renamed."
  value       = google_compute_firewall.deny_all_ingress.name
}

output "allow_internal_name" {
  description = "Name of the allow-internal ingress rule that permits traffic between hosts on the VPC subnet CIDR. Surfaced for the same compliance and audit purposes as the deny-all rule."
  value       = google_compute_firewall.allow_internal.name
}

output "allow_health_checks_name" {
  description = "Name of the firewall rule that opens health-check ports to Google's load balancer probe ranges. Surfaced for audit purposes and to confirm the rule exists before the load balancer backend service is created."
  value       = google_compute_firewall.allow_health_checks.name
}

output "allow_iap_name" {
  description = "Name of the firewall rule that opens SSH and RDP to the Identity-Aware Proxy source range. Surfaced for security audits to confirm IAP-only access is enforced and no broader SSH rule has been added."
  value       = google_compute_firewall.allow_iap.name
}