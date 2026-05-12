variable "name_handler" {
  description = "Valores para la estrategia de nombres"
  type = map(string)
  default = {
    "org" = "tecsmartapp"
    "app"        = "payments"
    "owner"      = "devops"    
  }
}