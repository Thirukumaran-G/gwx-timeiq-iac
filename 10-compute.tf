module "backend" {
  source            = "./modules/cloud_run"
  project_id        = var.project_id
  region            = var.region
  name              = local.backend_cr_name
  image             = var.backend_image
  service_account   = var.backend_runtime_sa_email
  connector_id      = module.connector.connector_id
  min_instances     = var.backend_min_instances
  max_instances     = var.backend_max_instances
  cpu               = var.backend_cpu
  memory            = var.backend_memory
  port              = var.backend_port
  health_check_path = var.health_check_path
  egress_mode = "PRIVATE_RANGES_ONLY"

  liveness_initial_delay     = var.liveness_initial_delay
  liveness_period            = var.liveness_period
  liveness_failure_threshold = var.liveness_failure_threshold
  startup_initial_delay      = var.startup_initial_delay
  startup_period             = var.startup_period
  startup_failure_threshold  = var.startup_failure_threshold

  labels = local.common_labels

  env_vars = {
    ENVIRONMENT                        = local.env
    APP_ENV                            = local.env
    DEPLOYMENT_ENVIRONMENT             = local.env
    PROJECT_ID                         = var.project_id
    GOOGLE_CLOUD_PROJECT               = var.project_id
    REDIS_HOST                         = module.redis.host
    REDIS_PORT                         = tostring(module.redis.port)
    REDIS_MAX_CONNECTIONS              = var.redis_max_connections
    POSTGRES_DB                        = var.db_name
    POSTGRES_HOST                      = module.database.private_ip
    POSTGRES_PORT                      = var.postgres_port
    POSTGRES_USER                      = var.db_user
    POSTGRES_SSLMODE                   = var.postgres_sslmode
    DB_POOL_SIZE                       = var.db_pool_size
    DB_MAX_OVERFLOW                    = var.db_max_overflow
    DB_POOL_TIMEOUT                    = var.db_pool_timeout
    DB_POOL_RECYCLE                    = var.db_pool_recycle
    DB_STATEMENT_TIMEOUT_MS            = var.db_statement_timeout_ms
    DB_IDLE_IN_TRANSACTION_TIMEOUT_MS  = var.db_idle_in_transaction_timeout_ms
    AUTO_RUN_MIGRATIONS                = var.auto_run_migrations
    APP_NAME                           = var.app_name
    SERVICE_NAMESPACE                  = local.prefix
    LOG_LEVEL                          = var.log_level
    DEBUG                              = var.debug
    AUTH_PROVIDER                      = var.auth_provider
    JWT_ALGORITHM                      = var.jwt_algorithm
    ACCESS_TOKEN_EXPIRE_MINUTES        = var.access_token_expire_minutes
    REFRESH_TOKEN_EXPIRE_DAYS          = var.refresh_token_expire_days
    PLATFORM_ADMIN_EMAIL               = var.platform_admin_email
    ALLOWED_ORIGINS                    = var.allowed_origins
    USE_GCS                            = var.use_gcs
    STORAGE_PROVIDER                   = var.storage_provider
    GCS_UPLOADS_BUCKET                 = var.gcs_uploads_bucket
    GCS_SEEDS_BUCKET                   = var.gcs_seeds_bucket
    GCS_INGEST_BUCKET                  = var.gcs_ingest_bucket
    SEEDS_DIR                          = var.seeds_dir
    INGEST_DIR                         = var.ingest_dir
    UPLOAD_DIR                         = var.upload_dir
    DOCUMENT_AI_PROJECT_ID             = var.project_id
    DOCUMENT_AI_LOCATION               = var.document_ai_location
    DOCUMENT_AI_PROCESSOR_ID          = var.document_ai_processor_id
    GEMINI_MAX_TOKENS                  = var.gemini_max_tokens
    GEMINI_EMBEDDING_MODEL             = var.gemini_embedding_model
    GEMINI_TIMEOUT                     = var.gemini_timeout
    WORKER_CONCURRENCY                 = var.worker_concurrency
    QUEUE_NAME                         = var.queue_name
    QUEUE_PROCESSING_TIMEOUT           = var.queue_processing_timeout
    CLIENT_SYNC_QUEUE                  = var.client_sync_queue
    ASSIGNMENT_SYNC_QUEUE              = var.assignment_sync_queue
    AUDIT_QUEUE_NAME                   = var.audit_queue_name
    AUDIT_DLQ_NAME                     = var.audit_dlq_name
    AUDIT_RATE_LIMIT_REQUESTS          = var.audit_rate_limit_requests
    AUDIT_RATE_LIMIT_WINDOW            = var.audit_rate_limit_window
    MAX_RETRY_ATTEMPTS                 = var.max_retry_attempts
    RETRY_BACKOFF_BASE                 = var.retry_backoff_base
    OTEL_TRACES_EXPORTER               = var.otel_traces_exporter
    OTEL_METRICS_EXPORTER              = var.otel_metrics_exporter
    OTEL_LOGS_EXPORTER                 = var.otel_logs_exporter
    OTEL_EXPORTER_OTLP_PROTOCOL        = var.otel_exporter_otlp_protocol
    OTEL_EXPORTER_OTLP_ENDPOINT        = var.otel_exporter_endpoint
    OTEL_SAMPLING_RATIO                = var.otel_sampling_ratio
    OTEL_PYTHON_GRPC_EXCLUDED_URLS     = "${var.otel_exporter_endpoint}/*"
    OTEL_PYTHON_REQUESTS_EXCLUDED_URLS = "${var.otel_exporter_endpoint}/*"
    INSTRUMENT_ALL                     = var.instrument_all
    ENABLE_CONSOLE_EXPORT              = var.enable_console_export
  }

  secret_env_vars = {
    DATABASE_URL = {
      secret_name = module.secrets.db_url_secret_name
      version     = "latest"
    }
    SECRET_KEY = {
      secret_name = module.secrets.secret_key_name
      version     = "latest"
    }
    REDIS_ADDR = {
      secret_name = module.secrets.redis_addr_secret_name
      version     = "latest"
    }
    GEMINI_API_KEY = {
      secret_name = module.secrets.gemini_api_key_secret_name
      version     = "latest"
    }
    POSTGRES_PASSWORD = {
      secret_name = module.secrets.db_password_secret_name
      version     = "latest"
    }
  }

  depends_on = [
    module.connector,
    module.database,
    module.redis,
    module.secrets,
  ]
}