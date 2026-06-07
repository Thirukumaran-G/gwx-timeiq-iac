module "database" {
  source               = "./modules/cloud_sql"
  project_id           = var.project_id
  region               = var.region
  name                 = local.sql_name
  tier                 = var.db_tier
  db_version           = var.db_version
  db_name              = var.db_name
  db_user              = var.db_user
  deletion_protection  = var.db_deletion_protection
  vpc_self_link        = module.vpc.vpc_self_link
  psa_range_name       = module.psa.psa_range_name
  backup_start_time    = var.db_backup_start_time
  transaction_log_days = var.db_transaction_log_days
  retained_backups     = var.db_retained_backups
  maintenance_day      = var.db_maintenance_day
  maintenance_hour     = var.db_maintenance_hour
  labels               = local.common_labels
  depends_on           = [module.psa, google_project_service.apis]
}