variable "virginia_cidr" {
    description = "CIDR Virginia"
    type = string
    sensitive = false
}

variable "public_subnet" {
    description = "CIDR public subnet"
    type = string
}

variable "private_subnet" {
    description = "CIDR private subnet"
    type = string
}

variable "tags" {
    description = "Tags del proyecto"
    type = map(string)  
}

variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type = string
}

variable "ec2_specs" {
  description = "Parámtros de la instancia"
  type = map(string)
}
variable "enable_monitoring_bool" {
  description = "Habilita el despliegue de un servidor de monitoreo"
  type = bool  
}
variable "enable_monitoring_numeric" {
  description = "Habilita el despliegue de un servidor de monitoreo"
  type = number  
}

variable "ingress_port_list" {
  type = list(number)
  
}

variable "access_key" {
  
}
variable "secret_key" {
  
}