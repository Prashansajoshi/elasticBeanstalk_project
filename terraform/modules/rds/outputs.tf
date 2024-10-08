output "db_instance_endpoint" {
  description = "The endpoint of the RDS instance"
  value       = aws_db_instance.prashansa_private_db_instance.address
}

output "db_instance_id" {
  description = "The ID of the RDS instance"
  value       = aws_db_instance.prashansa_private_db_instance.id
}
