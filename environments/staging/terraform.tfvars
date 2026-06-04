project_id   = "qwiklabs-gcp-00-5024a5ef17cf"
region       = "asia-south1"
environment  = "staging"
app_name     = "gwx-timeiq"
team_label   = "platform"
domain       = "staging.timeiq.genworx.ai"
alert_email  = "devops@genworx.ai"

vpc_cidr                 = "10.0.0.0/24"
connector_cidr           = "10.8.0.0/28"
psa_prefix_length        = 24
connector_min_throughput = 200
connector_max_throughput = 1000

health_check_ranges = ["35.191.0.0/16", "130.211.0.0/22"]
health_check_ports  = ["8080", "443"]
iap_cidr            = "35.235.240.0/20"

db_tier                  = "db-g1-small"
db_version               = "POSTGRES_15"
db_name                  = "timeiq"
db_user                  = "timeiq_user"
db_deletion_protection   = false
db_backup_start_time     = "02:00"
db_transaction_log_days  = 7
db_retained_backups      = 14
db_maintenance_day       = 7
db_maintenance_hour      = 3

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

# Paste from bootstrap output
backend_runtime_sa_email   = "gw-timeiq-api-sa-staging@YOUR_GCP_PROJECT_ID.iam.gserviceaccount.com"
backend_deployer_sa_email  = "gw-timeiq-be-deploy-staging@YOUR_GCP_PROJECT_ID.iam.gserviceaccount.com"
frontend_deployer_sa_email = "gw-timeiq-fe-deploy-staging@YOUR_GCP_PROJECT_ID.iam.gserviceaccount.com"