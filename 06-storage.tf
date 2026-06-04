module "storage" {
  source          = "./modules/storage"
  project_id      = var.project_id
  region          = var.region
  frontend_bucket = local.frontend_bucket
  environment     = local.env
  cors_max_age    = var.frontend_cors_max_age
  labels          = local.common_labels
  depends_on      = [google_project_service.apis]
}