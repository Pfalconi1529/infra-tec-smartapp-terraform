variable "tag_value" {
  description = "Valor para la etiquetas globales"
  type        = map(string)

  default = {
    "project"     = "aws-infra-whith-terraform"
    "owner"       = "tecsmartapp"
    "cost_center" = "infraestructura"
    "managed_by"  = "patriciofalconi34@gmail.com"
    "company"     = "tecsmartapp"
  }
}
