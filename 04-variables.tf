variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "Primary GCP region"
  type        = string
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  validation {
    condition     = contains(["staging", "prod"], var.environment)
    error_message = "Must be staging or prod."
  }
}

variable "app_name" {
  description = "Short application name used as resource prefix"
  type        = string
}

variable "team_label" {
  description = "Team label applied to all resources"
  type        = string
}

variable "domain" {
  description = "Root domain e.g. staging.timeiq.genworx.ai"
  type        = string
}

variable "vpc_cidr" {
  description = "VPC subnet CIDR"
  type        = string
}

variable "connector_cidr" {
  description = "VPC connector CIDR — must be /28"
  type        = string
}

variable "psa_prefix_length" {
  description = "PSA reserved range prefix length"
  type        = number
  default     = 16
}

variable "connector_min_throughput" {
  description = "VPC connector min throughput Mbps"
  type        = number
  default     = 200
}

variable "connector_max_throughput" {
  description = "VPC connector max throughput Mbps"
  type        = number
  default     = 1000
}

variable "health_check_ranges" {
  description = "Google health check source IP ranges"
  type        = list(string)
  default     = ["35.191.0.0/16", "130.211.0.0/22"]
}

variable "health_check_ports" {
  description = "Ports open for health checks"
  type        = list(string)
  default     = ["8080", "443"]
}

variable "iap_cidr" {
  description = "IAP TCP forwarding source range"
  type        = string
  default     = "35.235.240.0/20"
}

variable "db_tier" {
  description = "Cloud SQL tier"
  type        = string
}

variable "db_version" {
  description = "Postgres version string"
  type        = string
  default     = "POSTGRES_15"
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "db_user" {
  description = "Database user"
  type        = string
}

variable "db_deletion_protection" {
  description = "Enable deletion protection on Cloud SQL"
  type        = bool
  default     = true
}

variable "db_backup_start_time" {
  description = "Cloud SQL backup window start time HH:MM"
  type        = string
  default     = "02:00"
}

variable "db_transaction_log_days" {
  description = "Point-in-time recovery log retention days"
  type        = number
  default     = 7
}

variable "db_retained_backups" {
  description = "Number of daily backups to retain"
  type        = number
  default     = 14
}

variable "db_maintenance_day" {
  description = "Cloud SQL maintenance window day (1=Mon … 7=Sun)"
  type        = number
  default     = 7
}

variable "db_maintenance_hour" {
  description = "Cloud SQL maintenance window hour UTC"
  type        = number
  default     = 3
}

variable "redis_version" {
  description = "Redis version string"
  type        = string
  default     = "REDIS_7_0"
}

variable "redis_memory_gb" {
  description = "Redis memory in GB"
  type        = number
}

variable "redis_maxmemory_policy" {
  description = "Redis maxmemory eviction policy"
  type        = string
  default     = "allkeys-lru"
}

variable "redis_maintenance_day" {
  description = "Redis maintenance window day"
  type        = string
  default     = "SUNDAY"
}

variable "redis_maintenance_hour" {
  description = "Redis maintenance window hour UTC"
  type        = number
  default     = 2
}

variable "backend_image" {
  description = "Initial backend image — CI/CD manages after first apply"
  type        = string
  default     = "us-central1-docker.pkg.dev/gwx-devops-internship/gwx-timeiq-ar-staging/gwx-timeiq-gtk-be:22"
}

variable "backend_min_instances" {
  description = "Cloud Run min instances"
  type        = number
}

variable "backend_max_instances" {
  description = "Cloud Run max instances"
  type        = number
}

variable "backend_cpu" {
  description = "Cloud Run CPU limit"
  type        = string
  default     = "1"
}

variable "backend_memory" {
  description = "Cloud Run memory limit"
  type        = string
  default     = "512Mi"
}

variable "backend_port" {
  description = "Container port Cloud Run listens on"
  type        = number
  default     = 8080
}

variable "cdn_default_ttl" {
  description = "CDN default TTL seconds"
  type        = number
  default     = 3600
}

variable "cdn_max_ttl" {
  description = "CDN max TTL seconds"
  type        = number
  default     = 86400
}

variable "lb_timeout_sec" {
  description = "Load balancer backend service timeout seconds"
  type        = number
  default     = 30
}

variable "lb_log_sample_rate" {
  description = "Load balancer access log sample rate (0.0–1.0)"
  type        = number
  default     = 1.0
}

variable "rate_limit_count" {
  description = "Cloud Armor rate limit requests per interval"
  type        = number
  default     = 100
}

variable "rate_limit_interval_sec" {
  description = "Cloud Armor rate limit interval seconds"
  type        = number
  default     = 60
}

variable "dns_ttl" {
  description = "DNS A record TTL seconds"
  type        = number
  default     = 300
}

variable "frontend_cors_max_age" {
  description = "GCS CORS max age seconds"
  type        = number
  default     = 3600
}

variable "alert_email" {
  description = "Email for alerting notifications"
  type        = string
}

variable "backend_runtime_sa_email" {
  description = "Backend Cloud Run runtime SA email (created by bootstrap)"
  type        = string
}

variable "backend_deployer_sa_email" {
  description = "Backend deployer SA email (created by bootstrap)"
  type        = string
}

variable "frontend_deployer_sa_email" {
  description = "Frontend deployer SA email (created by bootstrap)"
  type        = string
}

variable "existing_dns_zone_name" {
  type = string
}

variable "gemini_api_key" {
  type      = string
  sensitive = true
}

variable "gcs_uploads_bucket" {
  type = string
}

variable "gcs_seeds_bucket" {
  type = string
}

variable "gcs_ingest_bucket" {
  type = string
}

variable "document_ai_processor_id" {
  type = string
}

variable "document_ai_location" {
  type = string
}

variable "platform_admin_email" {
  type = string
}

variable "allowed_origins" {
  type = string
}

variable "log_level" {
  type = string
}

variable "debug" {
  type = string
}

variable "auth_provider" {
  type = string
}

variable "jwt_algorithm" {
  type = string
}

variable "access_token_expire_minutes" {
  type = string
}

variable "refresh_token_expire_days" {
  type = string
}

variable "auto_run_migrations" {
  type = string
}

variable "use_gcs" {
  type = string
}

variable "storage_provider" {
  type = string
}

variable "seeds_dir" {
  type = string
}

variable "ingest_dir" {
  type = string
}

variable "upload_dir" {
  type = string
}

variable "redis_ssl" {
  type = string
}

variable "redis_ssl_cert_reqs" {
  type = string
}

variable "redis_max_connections" {
  type = string
}

variable "postgres_port" {
  type = string
}

variable "postgres_sslmode" {
  type = string
}

variable "db_pool_size" {
  type = string
}

variable "db_max_overflow" {
  type = string
}

variable "db_pool_timeout" {
  type = string
}

variable "db_pool_recycle" {
  type = string
}

variable "db_statement_timeout_ms" {
  type = string
}

variable "db_idle_in_transaction_timeout_ms" {
  type = string
}

variable "gemini_max_tokens" {
  type = string
}

variable "gemini_embedding_model" {
  type = string
}

variable "gemini_timeout" {
  type = string
}

variable "worker_concurrency" {
  type = string
}

variable "queue_name" {
  type = string
}

variable "queue_processing_timeout" {
  type = string
}

variable "client_sync_queue" {
  type = string
}

variable "assignment_sync_queue" {
  type = string
}

variable "audit_queue_name" {
  type = string
}

variable "audit_dlq_name" {
  type = string
}

variable "audit_rate_limit_requests" {
  type = string
}

variable "audit_rate_limit_window" {
  type = string
}

variable "max_retry_attempts" {
  type = string
}

variable "retry_backoff_base" {
  type = string
}

variable "otel_traces_exporter" {
  type = string
}

variable "otel_metrics_exporter" {
  type = string
}

variable "otel_logs_exporter" {
  type = string
}

variable "otel_exporter_otlp_protocol" {
  type = string
}

variable "otel_exporter_endpoint" {
  type = string
}

variable "otel_sampling_ratio" {
  type = string
}

variable "instrument_all" {
  type = string
}

variable "enable_console_export" {
  type = string
}