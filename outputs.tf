output "lb_ip" {
  description = "Point your domain A record here"
  value       = google_compute_global_address.lb_ip.address
}

output "frontend_bucket" {
  description = "Upload built React files here"
  value       = module.storage.frontend_bucket_name
}

output "backend_service_name" {
  description = "Cloud Run service name"
  value       = module.backend.service_name
}

output "db_connection_name" {
  value = module.database.connection_name
}

output "redis_host" {
  value = module.redis.host
}

output "nameservers" {
  description = "Point your domain registrar at these NS records"
  value       = google_dns_managed_zone.main.name_servers
}