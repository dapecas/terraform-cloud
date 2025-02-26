virginia_cidr = "10.10.0.0/16"
public_subnet = "10.10.0.0/24"
private_subnet = "10.10.1.0/24"
tags = {
    "env" = "dev"
    "owner" = "Dav"
    "cloud" = "AWS"
    "IAC" = "Terraform"
    "IAC_version" = "1.3.6"
    "project" = "cerberus"
    "region" = "virginia"
}
sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami" = "ami-04681163a08179f28"
  "instance_type" = "t2.micro"
}

enable_monitoring_bool = false
enable_monitoring_numeric = 0

ingress_port_list = [ 22, 80, 443 ]