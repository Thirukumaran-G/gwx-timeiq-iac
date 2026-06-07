output "host" {
  description = "Private IP address of the Redis instance within the VPC."
  value       = google_redis_instance.redis.host
}

output "port" {
  description = "Port number the Redis instance listens on."
  value       = google_redis_instance.redis.port
}