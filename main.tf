module "network" {
  source = "./network"

  project_id               = var.project_id
  region                   = var.region
  vpc_name                 = var.vpc_name
  managed_subnet_region    = var.managed_subnet_region
  restricted_subnet_region = var.restricted_subnet_region
  managed_subnet_CIDR      = var.managed_subnet_CIDR
  restricted_subnet_CIDR   = var.restricted_subnet_CIDR
  nat_name                 = var.nat_name
  router_name              = var.router_name
  router_region            = var.region


}
