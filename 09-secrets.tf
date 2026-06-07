module "secrets" {
  source             = "./modules/secrets"
  project_id         = var.project_id
  prefix             = local.prefix
  env                = local.env
  db_connection_name = module.database.connection_name
  db_user            = var.db_user
  db_name            = var.db_name
  db_password        = module.database.db_password
  redis_host         = module.redis.host
  redis_port         = module.redis.port
  gemini_api_key     = var.gemini_api_key
  labels             = local.common_labels
  depends_on         = [module.database, module.redis, google_project_service.apis]
}