module "tags" {

  source = "../../modules/tags"
  
}


module "vpc" {
  source = "../../modules/vpc"
  common_tags = module.tags.common_tags
}