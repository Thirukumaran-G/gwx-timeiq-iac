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

  liveness_initial_delay  = var.liveness_initial_delay
  liveness_period         = var.liveness_period
  liveness_failure_threshold = var.liveness_failure_threshold
  startup_initial_delay   = var.startup_initial_delay
  startup_period          = var.startup_period
  startup_failure_threshold = var.startup_failure_threshold

  labels = local.common_labels

  env_vars = {
    ENVIRONMENT = local.env
    PROJECT_ID  = var.project_id
    REDIS_HOST  = module.redis.host
    REDIS_PORT  = tostring(module.redis.port)
    DB_NAME     = var.db_name
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
  }

  depends_on = [
    module.connector,
    module.database,
    module.redis,
    module.secrets,
  ]
}