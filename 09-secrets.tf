module "secrets" {
  source             = "./modules/secrets"
  project_id         = var.project_id
  prefix             = local.prefix
  env                = local.env
  db_connection_name = module.database.connection_name
  db_user            = var.db_user
  db_name            = var.db_name
  db_password        = module.database.db_password
  labels             = local.common_labels
  depends_on         = [module.database, google_project_service.apis]
}