output "host" {
  description = "Private IP address of the Redis instance within the VPC. Passed from 08-redis.tf up to 10-compute.tf and injected into the Cloud Run service as the REDIS_HOST environment variable so the FastAPI application knows which host to connect to for cache reads and writes."
  value       = google_redis_instance.redis.host
}

output "port" {
  description = "Port number the Redis instance listens on, typically 6379. Passed from 08-redis.tf up to 10-compute.tf, converted to a string with tostring(), and injected into the Cloud Run service as the REDIS_PORT environment variable alongside REDIS_HOST."
  value       = google_redis_instance.redis.port
}