locals {
  org     = var.name_handler["org"]
  app     = var.name_handler["app"]
  owner   = var.name_handler["owner"]

  base_name = join("-", [
    local.org,
    local.app,
    local.owner
  ])
}