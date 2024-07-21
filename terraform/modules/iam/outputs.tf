output "eb_role_name" {
  value = aws_iam_role.eb_role.name
}

output "eb_instance_profile_name" {
  value = aws_iam_instance_profile.eb_profile.name
}




# output "aws_iam_instance_profile" {
#   value = aws_iam_instance_profile.this.name
# }