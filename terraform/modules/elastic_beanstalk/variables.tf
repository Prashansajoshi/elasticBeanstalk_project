variable "application_name" {
  description = "The name of the Elastic Beanstalk application"
  type        = string
  default     = "my-nodejs-app"
}

variable "environment_name" {
  description = "The name of the Elastic Beanstalk environment"
  type        = string
  default     = "my-nodejs-env"
}

variable "instance_type" {
  description = "The EC2 instance type for the Elastic Beanstalk environment"
  type        = string
  default     = "t2.micro"
}

variable "solution_stack_name" {
  description = "The solution stack name for Elastic Beanstalk"
  type        = string
  # default     = "64bit Amazon Linux 2 v5.5.0 running Node.js 16"
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access to the EC2 instances"
  type        = string
  default     = "my-key-pair"
}

variable "database_name" { 
}

variable "db_username" { 
}

variable "db_password" { 
}

variable "db_host" {
  description = "The endpoint of the RDS database"
  type        = string
}

variable "iam_instance_profile" {
  description = "The name of the IAM instance profile for Elastic Beanstalk"
  type        = string
}

variable "all_cidr_block" {
  description = "The CIDR block for allowing access."
  default     = "0.0.0.0/0"
}

variable "security_group_id" {
  description = "The ID of the security group to attach to the Elastic Beanstalk environment."
}

variable "notification_email" {
  description = "The email address to send CloudWatch alarm notifications to"
  type        = string
}






variable "green_environment_name" {
  description = "The name of the Elastic Beanstalk environment"
  type        = string
  default     = "green-nodejs-env"
}

variable "green_solution_stack_name" {
  description = "The solution stack name for Elastic Beanstalk"
  type        = string
  # default     = "64bit Amazon Linux 2 v5.5.0 running Node.js 16"
}

variable "bucket_name" {
  default = "my-nodejs-app-eb-bucket"
}