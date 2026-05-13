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

module "terraform_cloud_oidc" {

  source = "../../modules/aim"
  aws_region = "us-east-1"
  role_name = "tfc-dev-role"
  tfc_organization_name = "MI_ORG"
  tfc_project_name = "devops-project"
  tfc_workspace_name = "dev-workspace"
  permissions_policy_arn = "arn:aws:iam::aws:policy/PowerUserAccess"
}