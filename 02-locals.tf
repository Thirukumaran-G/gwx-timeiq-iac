locals {
  prefix = var.app_name
  env    = var.environment

  vpc_name        = "${local.prefix}-vpc-${local.env}"
  subnet_name     = "${local.prefix}-subnet-${local.env}"
  connector_name  = "gwx-tiq-stg-conn"
  router_name     = "${local.prefix}-router-${local.env}"
  nat_name        = "${local.prefix}-nat-${local.env}"
  psa_range_name  = "${local.prefix}-psa-${local.env}"
  sql_name        = "${local.prefix}-pg-${local.env}"
  redis_name      = "${local.prefix}-redis-${local.env}"
  backend_cr_name = "${local.prefix}-api-${local.env}"
  ar_name         = "${local.prefix}-ar-${local.env}"
  frontend_bucket = "${local.prefix}-fe-${local.env}-${var.project_id}"
  lb_name         = "${local.prefix}-lb-${local.env}"
  armor_name      = "${local.prefix}-armor-${local.env}"
  dns_zone_name   = "${local.prefix}-zone-${local.env}"

  common_labels = {
    app         = var.app_name
    environment = local.env
    managed_by  = "terraform"
    team        = var.team_label
  }
}