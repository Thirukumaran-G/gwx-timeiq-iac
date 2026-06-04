module "redis" {
  source             = "./modules/redis"
  project_id         = var.project_id
  region             = var.region
  name               = local.redis_name
  memory_size_gb     = var.redis_memory_gb
  redis_version      = var.redis_version
  maxmemory_policy   = var.redis_maxmemory_policy
  maintenance_day    = var.redis_maintenance_day
  maintenance_hour   = var.redis_maintenance_hour
  vpc_self_link      = module.vpc.vpc_self_link
  labels             = local.common_labels
  depends_on         = [module.psa, google_project_service.apis]
}