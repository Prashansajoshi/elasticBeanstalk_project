variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "value of subnet cidr"
  type        = string
}

variable "subnet_cidr_public_2" {
  description = "value of public subnet cidr 2"
  type        = string
}

variable "subnet_cidr_private_1" {
  description = "value of private subnet cidr 1"
  type        = string
}

variable "subnet_cidr_private_2" {
  description = "value of private subnet cidr 2"
  type        = string
}

variable "database_subnet_1_cidr" {
  description = "The CIDR block for the first database subnet"
  type        = string
}

variable "database_subnet_2_cidr" {
  description = "The CIDR block for the second database subnet"
  type        = string
}

variable "all_cidr_block" {
  description = "All CIDR block i.e 0.0.0.0/0"
  type        = string
}

variable "ami" {
  description = "default ami"
  type        = string
}

variable "instance_type" {
  description = "instance type"
}

variable "key_name" {
  description = "default keypair"
}

variable "availability_zone_1" {
  description = "Availability zone for subnet"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability zone for subnet"
  type        = string
}


variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "The ACL for the S3 bucket"
  type        = string
}

variable "versioning" {
  description = "Enable versioning"
  type        = bool
}

variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
}

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket"
  type        = bool
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket"
  type        = bool
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket"
  type        = bool
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket"
  type        = bool
}

variable "database_name" {
  description = "Database name"
}

variable "db_username" {
  description = "Database username"
}

variable "db_password" {
  description = "Database password"
}


variable "application_name" {
  description = "The name of the Elastic Beanstalk application"
  type        = string
}

variable "environment_name" {
  description = "The name of the Elastic Beanstalk environment"
  type        = string
}

variable "solution_stack_name" {
  description = "The solution stack name for Elastic Beanstalk"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID for the environment"
  type        = string
}

variable "subnet_ids" {
  description = "The subnet IDs for the environment"
  type        = list(string)
}

variable "elb_subnet_ids" {
  description = "The ELB subnet IDs for the environment"
  type        = list(string)
}

variable "iam_instance_profile" {
  description = "The IAM instance profile for Elastic Beanstalk"
  type        = string
}

variable "green_environment_name" {
  description = "The name of the Elastic Beanstalk environment"
  type        = string
}

variable "green_solution_stack_name" {
  description = "The solution stack name for Elastic Beanstalk"
  type        = string
}

variable "notification_email" {
  description = "The email address to send CloudWatch alarm notifications to"
  type        = string
}

variable "rds_credentials_secret_name" {
  description = "The name of the Secrets Manager secret containing RDS credentials"
  type        = string
}

variable "rds_credentials_secret_arn" {
  description = "The ARN of the Secrets Manager secret for the RDS credentials"
  type        = string
}