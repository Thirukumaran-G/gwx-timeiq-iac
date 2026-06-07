project_id             = "gwx-devops-internship"
region                 = "us-central1"
environment            = "staging"
app_name               = "gwx-timeiq"
team_label             = "platform"
domain                 = "staging.timeiq.deploy.poc.genworx.ai"
existing_dns_zone_name = "deploy-poc-genworx-ai"
alert_email            = "thirukumarang@genworx.ai"

vpc_cidr                 = "10.0.0.0/24"
connector_cidr           = "10.8.0.0/28"
psa_prefix_length        = 16
connector_min_throughput = 200
connector_max_throughput = 1000

health_check_ranges = ["35.191.0.0/16", "130.211.0.0/22"]
health_check_ports  = ["8080", "443"]
iap_cidr            = "35.235.240.0/20"

db_tier                 = "db-g1-small"
db_version              = "POSTGRES_CLOUDSQL_POSTGRES_18"
db_name                 = "timeiq"
db_user                 = "timeiq_user"
db_deletion_protection  = false
db_backup_start_time    = "02:00"
db_transaction_log_days = 7
db_retained_backups     = 14
db_maintenance_day      = 7
db_maintenance_hour     = 3

redis_version          = "REDIS_7_0"
redis_memory_gb        = 1
redis_maxmemory_policy = "allkeys-lru"
redis_maintenance_day  = "SUNDAY"
redis_maintenance_hour = 2

backend_min_instances = 1
backend_max_instances = 5
backend_cpu           = "1"
backend_memory        = "512Mi"
backend_port          = 8080
health_check_path     = "/health"

liveness_initial_delay     = 10
liveness_period            = 30
liveness_failure_threshold = 3
startup_initial_delay      = 5
startup_period             = 5
startup_failure_threshold  = 10

cdn_default_ttl         = 3600
cdn_max_ttl             = 86400
lb_timeout_sec          = 30
lb_log_sample_rate      = 1.0
rate_limit_count        = 100
rate_limit_interval_sec = 60
dns_ttl                 = 300
frontend_cors_max_age   = 3600

backend_runtime_sa_email   = "gwx-timeiq-api-sa-staging@gwx-devops-internship.iam.gserviceaccount.com"
backend_deployer_sa_email  = "gwx-timeiq-be-deploy-staging@gwx-devops-internship.iam.gserviceaccount.com"
frontend_deployer_sa_email = "gwx-timeiq-fe-deploy-staging@gwx-devops-internship.iam.gserviceaccount.com"

# Secrets
gemini_api_key = "YOUR_GEMINI_API_KEY_HERE"

# GCS
gcs_uploads_bucket = "gw-timeiq-gtk-gcs-uploads-staging-01"
gcs_seeds_bucket   = "gw-timeiq-gtk-gcs-seeds-staging-01"
gcs_ingest_bucket  = "gw-timeiq-gtk-gcs-ingest-staging-01"

# Document AI
document_ai_processor_id = "b61dddef1553cb93"
document_ai_location     = "us"

# App
platform_admin_email = "gwx-timeiq-support@genworx.ai"
allowed_origins      = "https://staging.timeiq.genworx.ai"
log_level            = "DEBUG"
debug                = "true"
auth_provider        = "local"
jwt_algorithm        = "HS256"
access_token_expire_minutes = "30"
refresh_token_expire_days   = "7"
auto_run_migrations         = "true"

# Storage
use_gcs          = "true"
storage_provider = "gcs"
seeds_dir        = "data/seeds"
ingest_dir       = "data/ingest"
upload_dir       = "data/uploads"

# Redis
redis_ssl            = "true"
redis_ssl_cert_reqs  = "none"
redis_max_connections = "50"

# DB connection
postgres_port    = "5432"
postgres_sslmode = "require"
db_pool_size     = "3"
db_max_overflow  = "5"
db_pool_timeout  = "30"
db_pool_recycle  = "1800"
db_statement_timeout_ms           = "30000"
db_idle_in_transaction_timeout_ms = "60000"

# Gemini
gemini_max_tokens      = "2048"
gemini_embedding_model = "gemini-embedding-001"
gemini_timeout         = "30s"

# Worker
worker_concurrency       = "2"
queue_name               = "timesheet_queue"
queue_processing_timeout = "300"
client_sync_queue        = "client_sync_queue"
assignment_sync_queue    = "assignment_sync_queue"
audit_queue_name         = "audit_queue"
audit_dlq_name           = "audit_dlq"
audit_rate_limit_requests = "100"
audit_rate_limit_window   = "60"
max_retry_attempts        = "3"
retry_backoff_base        = "2"

# OTEL
# otel_traces_exporter              = "otlp"
# otel_metrics_exporter             = "otlp"
# otel_logs_exporter                = "otlp"
# otel_exporter_otlp_protocol       = "http/protobuf"
# otel_exporter_endpoint            = "https://ingress.us-west-2.aws.dash0.com"
# otel_sampling_ratio               = "1.0"
# instrument_all                    = "true"
# enable_console_export             = "false"

otel_traces_exporter        = "none"
otel_metrics_exporter       = "none"
otel_logs_exporter          = "none"
otel_exporter_otlp_protocol = "http/protobuf"
otel_exporter_endpoint      = "https://ingress.us-west-2.aws.dash0.com"
otel_sampling_ratio         = "0.0"
instrument_all              = "false"
enable_console_export       = "false"