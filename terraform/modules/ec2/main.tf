# resource "aws_instance" "prashansa_terraform_ec2" {
#   ami                         = var.ami
#   instance_type               = var.instance_type
#   key_name                    = var.key_name
#   vpc_security_group_ids      = [var.security_group_id] # Attach the security group
#   subnet_id                   = var.prashansa_terraform_subnet_1
#   associate_public_ip_address = true
#   iam_instance_profile        = var.aws_iam_instance_profile


#   tags = {
#     Name        = "prashansa_terraform_public_1"
#     silo        = "intern2"
#     owner       = "prashansa.joshi"
#     terraform   = "true"
#     environment = "dev"
#   }

# }

# resource "aws_instance" "prashansa_terraform_ec2_2" {
#   ami                         = var.ami
#   instance_type               = var.instance_type
#   key_name                    = var.key_name
#   vpc_security_group_ids      = [var.security_group_id] # Attach the security group
#   subnet_id                   = var.prashansa_terraform_subnet_2
#   associate_public_ip_address = true

#   tags = {
#     Name        = "prashansa_terraform__public_2"
#     silo        = "intern2"
#     owner       = "prashansa.joshi"
#     terraform   = "true"
#     environment = "dev"
#   }

# }
