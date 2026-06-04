resource "google_redis_instance" "redis" {
  project            = var.project_id
  name               = var.name
  tier               = var.tier
  memory_size_gb     = var.memory_size_gb
  region             = var.region
  redis_version      = var.redis_version
  authorized_network = var.vpc_self_link
  connect_mode       = var.connect_mode

  redis_configs = {
    "maxmemory-policy" = var.maxmemory_policy
  }

  maintenance_policy {
    weekly_maintenance_window {
      day = var.maintenance_day
      start_time {
        hours   = var.maintenance_hour
        minutes = 0
        seconds = 0
        nanos   = 0
      }
    }
  }

  labels = var.labels
}