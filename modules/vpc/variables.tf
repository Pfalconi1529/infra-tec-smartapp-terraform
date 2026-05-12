variable "common_tags" {
  type = map(string)
}

variable "out_name" {
  description = "Valor para la estrategia de nombres"
  type        =  map(string) 
}

variable "env" {
  description = "Contexto para la estrategia de nombres"
  type        = string
}

variable "region" {
  description = "Contexto para la estrategia de nombres"
  type        = string
}
variable "resource_name" {
  description = "Nombre del recurso"
  type        = string
}