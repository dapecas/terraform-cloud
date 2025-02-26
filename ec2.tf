variable "instancias" {
  description = "Nombre de las instancias"
  type = set(string)
  default = [ "apache"]
  
}
# resource "aws_instance" "linux" {
#   count = length(var.instancias)
#   ami                    = var.ec2_specs.ami
#   instance_type          = var.ec2_specs.instance_type
#   subnet_id              = aws_subnet.public_subnet.id
#   key_name               = data.aws_key_pair.key.key_name
#   vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
#   #Esto es lo mismo que hacer provisioner "local-exec"
#   user_data = file("scripts/userdata.sh")

#   tags = {
#     "Name" = var.instancias[count.index]
#   }
# }

resource "aws_instance" "linux" {
  for_each = var.instancias
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  #Esto es lo mismo que hacer provisioner "local-exec"
  user_data = file("scripts/userdata.sh")

  tags = {
    "Name" = "${each.value}-${local.sufix}"
  }
}

resource "aws_instance" "monitoring_instance" {
  #count = var.enable_monitoring_bool ? 1:0 #PARA BOOL -> Si es true, da 1. Si es false, da 0. Con 1, se crea 1 instancia.
  count = var.enable_monitoring_numeric == 1 ? 1:0  #PARA NUMERIC -> Si es igual a 1, count=1. Si es distinto de 1, count = 0, no se crea la instancia
  ami                    = var.ec2_specs.ami
  instance_type          = var.ec2_specs.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  key_name               = data.aws_key_pair.key.key_name
  vpc_security_group_ids = [aws_security_group.sg_public_instance.id]
  #Esto es lo mismo que hacer provisioner "local-exec"
  user_data = file("scripts/userdata.sh")

  tags = {
    "Name" = "Monitoreo-${local.sufix}"
  }
}