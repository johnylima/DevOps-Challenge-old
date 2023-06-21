resource "random_string" "suffix" {
  length  = 8
  special = false
}

locals {
  name_prefix         = "${var.naming_prefix}-${terraform.workspace}"
  name_prefix_project = var.naming_prefix_project
  cluster_name        = lower("${local.name_prefix}-eks-${var.project}-${random_string.suffix.result}")
}
module "tags" {
  source       = "./modules/tags"
  company      = var.company
  project      = var.project
  billing_code = var.billing_code
  environment  = var.environment
}

module "networking" {
  source                   = "./modules/networking"
  tags                     = module.tags.tags
  cluster_name             = local.cluster_name
  name_prefix_project      = local.name_prefix_project
  vpc_cidr                 = "10.0.0.0/16"
  availability_zones_count = 3
  subnet_cidr_bits         = 8
}

module "eks" {
  source              = "./modules/eks"
  tags                = module.tags.tags
  cluster_name        = local.cluster_name
  cluster_version     = "1.27"
  name_prefix_project = local.name_prefix_project
  vpc_id              = module.networking.vpc_id
  private_subnet_ids  = module.networking.private_subnet_ids
  public_subnet_ids   = module.networking.public_subnet_ids
  instance_types      = ["t3.medium"]
}

module "database" {
  source             = "./modules/database"
  availability_zones = ["eu-west-3a", "eu-west-3b", "eu-west-3c"]
  cluster_identifier = lower("${local.name_prefix}-cluster-${random_string.suffix.result}")
  identifier         = lower("${local.name_prefix}-${var.project}")
  database_name      = lower(replace("${var.company}${var.application}", "-", ""))
  engine_version     = "15.2"
  instance_class     = "db.r5.large"
  master_username    = lower("${var.company}")
  private_subnet_ids = module.networking.private_subnet_ids
  vpc_id             = module.networking.vpc_id
  tags               = module.tags.tags
}