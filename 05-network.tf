module "vpc" {
  source     = "./modules/network/vpc"
  project_id = var.project_id
  vpc_name   = local.vpc_name
  labels     = local.common_labels
  depends_on = [google_project_service.apis]
}

module "subnet" {
  source      = "./modules/network/subnet"
  project_id  = var.project_id
  region      = var.region
  subnet_name = local.subnet_name
  vpc_name    = module.vpc.vpc_name
  cidr        = var.vpc_cidr
  labels      = local.common_labels
  depends_on  = [module.vpc]
}

module "psa" {
  source         = "./modules/network/psa"
  project_id     = var.project_id
  psa_range_name = local.psa_range_name
  vpc_self_link  = module.vpc.vpc_self_link
  prefix_length  = var.psa_prefix_length
  depends_on     = [module.vpc]
}

module "connector" {
  source         = "./modules/network/connector"
  project_id     = var.project_id
  region         = var.region
  connector_name = local.connector_name
  vpc_name       = module.vpc.vpc_name
  cidr           = var.connector_cidr
  min_throughput = var.connector_min_throughput
  max_throughput = var.connector_max_throughput
  depends_on     = [module.subnet, google_project_service.apis]
}

module "nat" {
  source      = "./modules/network/nat"
  project_id  = var.project_id
  region      = var.region
  router_name = local.router_name
  nat_name    = local.nat_name
  vpc_name    = module.vpc.vpc_name
  subnet_name = module.subnet.subnet_name
  depends_on  = [module.subnet]
}

module "firewall" {
  source              = "./modules/network/firewall"
  project_id          = var.project_id
  vpc_name            = module.vpc.vpc_name
  internal_cidr       = var.vpc_cidr
  health_check_ranges = var.health_check_ranges
  health_check_ports  = var.health_check_ports
  iap_cidr            = var.iap_cidr
  depends_on          = [module.vpc]
}