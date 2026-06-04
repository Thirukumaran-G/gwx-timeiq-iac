output "frontend_bucket_name" {
  description = "Name of the GCS bucket that hosts the compiled React static files. Used in three places: passed to the loadbalancer resources in 11-loadbalancer.tf as the google_compute_backend_bucket target; printed in the root outputs.tf so the frontend CI/CD pipeline knows which bucket to upload build artifacts to; and used in the post-apply bootstrap gcloud command that grants the frontend deployer SA storage.objectAdmin on this bucket."
  value       = google_storage_bucket.frontend.name
}

output "frontend_bucket_self_link" {
  description = "Self-link URI of the frontend GCS bucket. Available for any resource that needs a URI reference to the bucket rather than just its name, such as a future bucket replication or lifecycle policy attachment."
  value       = google_storage_bucket.frontend.self_link
}