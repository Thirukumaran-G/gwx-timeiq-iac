output "service_url" {
  description = "HTTPS URL of the deployed Cloud Run service, e.g. https://gw-timeiq-api-staging-abc123-el.a.run.app. Used in the backend CI/CD smoke test step to verify the /health endpoint returns 200 after each deployment. Also surfaced in root outputs for manual curl testing and for wiring any future service-to-service calls."
  value       = google_cloud_run_v2_service.this.uri
}

output "service_name" {
  description = "Name of the Cloud Run service, e.g. gw-timeiq-api-staging. Used in two places: passed to the google_compute_region_network_endpoint_group in 11-loadbalancer.tf so the load balancer can route /api/* traffic to this service; and printed in the root outputs.tf so the backend CI/CD workflow knows the exact service name to target in the gcloud run deploy command."
  value       = google_cloud_run_v2_service.this.name
}