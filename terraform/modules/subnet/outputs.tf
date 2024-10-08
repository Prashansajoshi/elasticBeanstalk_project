output "public_subnet_1" {
    value = aws_subnet.prashansa_terraform_subnet_1.id
}

output "public_subnet_2" {
    value = aws_subnet.prashansa_terraform_subnet_public_2.id
}

output "private_subnet_1" {
    value = aws_subnet.prashansa_terraform_subnet_private_1.id
}

output "private_subnet_2" {
    value = aws_subnet.prashansa_terraform_subnet_private_2.id
}

output "db_subnet_1" {
    value = aws_subnet.prashansa_database_1.id
}

output "db_subnet_2" {
    value = aws_subnet.prashansa_database_2.id
}