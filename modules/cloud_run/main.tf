resource "google_cloud_run_v2_service" "this" {
  project  = var.project_id
  name     = var.name
  location = var.region
  ingress  = var.ingress_mode
  labels   = var.labels

  template {
    service_account = var.service_account

    scaling {
      min_instance_count = var.min_instances
      max_instance_count = var.max_instances
    }

    vpc_access {
      connector = var.connector_id
      egress    = var.egress_mode
    }

    containers {
      image = var.image

      ports { container_port = var.port }

      resources {
        limits = {
          cpu    = var.cpu
          memory = var.memory
        }
        startup_cpu_boost = true
      }

      dynamic "env" {
        for_each = var.env_vars
        content {
          name  = env.key
          value = env.value
        }
      }

      dynamic "env" {
        for_each = var.secret_env_vars
        content {
          name = env.key
          value_source {
            secret_key_ref {
              secret  = env.value.secret_name
              version = env.value.version
            }
          }
        }
      }

      liveness_probe {
        http_get { path = var.health_check_path }
        initial_delay_seconds = var.liveness_initial_delay
        period_seconds        = var.liveness_period
        failure_threshold     = var.liveness_failure_threshold
      }

      startup_probe {
        http_get { path = var.health_check_path }
        initial_delay_seconds = var.startup_initial_delay
        period_seconds        = var.startup_period
        failure_threshold     = var.startup_failure_threshold
      }
    }
  }

  traffic {
    type    = var.traffic_type
    percent = 100
  }

  lifecycle {
    ignore_changes = [
      template[0].containers[0].image,
      client,
      client_version,
    ]
  }
}