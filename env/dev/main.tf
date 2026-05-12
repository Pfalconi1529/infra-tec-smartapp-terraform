module "tags" {
  source = "../../modules/tags"
}

module "base_name" {
  source = "../../modules/naming"
}

module "vpc" {
  source = "../../modules/vpc"
  common_tags = module.tags.common_tags
  out_name = module.base_name.out_name
  env = local.env
  region = local.region
  resource_name = local.resource_name
}