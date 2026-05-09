locals {
  region  = "eu-west-1"
  ami     = var.ubuntu_ami[local.region]
  entorno = "dev"
}
