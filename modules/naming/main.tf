locals {
  org     = var.name_handler["org"]
  app     = var.name_handler["app"]

  base_name = join("-", [
    local.org,
    local.app,
  ])
}