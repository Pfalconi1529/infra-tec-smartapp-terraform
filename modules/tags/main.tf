locals {
  common_tags = {
    company             = var. tag_value["company"]
    project             = var.tag_value["project"]
    owner               = var.tag_value["owner"]
    cost_center         = var.tag_value["cost_center"]
    repository          = var.tag_value["repository"]
    workspace           = var.tag_value["workspace"]
  }
}

