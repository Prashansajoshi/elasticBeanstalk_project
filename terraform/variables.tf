variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  # default     = "10.0.0.0/16"
  type        = string
}

variable "subnet_cidr" {
  description = "value of subnet cidr"
  # default     = "10.0.1.0/24"
  type        = string
}

variable "subnet_cidr_public_2" {
  description = "value of public subnet cidr 2"
  default     = "10.0.2.0/24"
  type        = string
}

variable "subnet_cidr_private_1" {
  description = "value of private subnet cidr 1"
  # default     = "10.0.3.0/24"
  type        = string
}

variable "subnet_cidr_private_2" {
  description = "value of private subnet cidr 2"
  # default     = "10.0.4.0/24"
  type        = string
}

variable "database_subnet_1_cidr" {
  description = "The CIDR block for the first database subnet"
  # default     = "10.0.101.0/24"
  type        = string
}

variable "database_subnet_2_cidr" {
  description = "The CIDR block for the second database subnet"
  # default     = "10.0.102.0/24"
  type        = string
}

variable "all_cidr_block" {
  description = "All CIDR block i.e 0.0.0.0/0"
  # default     = "0.0.0.0/0"
  type        = string
}

variable "ami" {
  description = "default ami"
  # default     = "ami-04b70fa74e45c3917"
  type        = string
}

variable "instance_type" {
  description = "instance type"
  # default     = "t2.micro"
}

variable "key_name" {
  description = "default keypair"
  # default     = "prashansa-lambda"
}

variable "availability_zone_1" {
  description = "Availability zone for subnet"
  # default     = "us-east-1a"
  type        = string
}

variable "availability_zone_2" {
  description = "Availability zone for subnet"
  # default     = "us-east-1b"
  type        = string
}


###S3
variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  # default     = "prashansa-s3-bucket"
}

variable "acl" {
  description = "The ACL for the S3 bucket"
  type        = string
  # default     = "private"
}

variable "versioning" {
  description = "Enable versioning"
  type        = bool
  # default     = false
}

variable "tags" {
  description = "A map of tags to assign to the bucket"
  type        = map(string)
  # default     = {}
}

variable "block_public_acls" {
  description = "Whether Amazon S3 should block public ACLs for this bucket"
  type        = bool
  # default     = true
}

variable "block_public_policy" {
  description = "Whether Amazon S3 should block public bucket policies for this bucket"
  type        = bool
  # default     = false
}

variable "ignore_public_acls" {
  description = "Whether Amazon S3 should ignore public ACLs for this bucket"
  type        = bool
  # default     = true
}

variable "restrict_public_buckets" {
  description = "Whether Amazon S3 should restrict public bucket policies for this bucket"
  type        = bool
  # default     = true
}

variable "database_name" {
  description = "Database name"
  # default     = "testdb"
}

variable "db_username" {
  description = "Database username"
  # default     = "testuser"
}

variable "db_password" {
  description = "Database password"
  # default     = "test0000"
}


##ebs
variable "application_name" {
  description = "The name of the Elastic Beanstalk application"
  type        = string
  # default     = "my-nodejs-app"
}

variable "environment_name" {
  description = "The name of the Elastic Beanstalk environment"
  type        = string
  # default     = "my-nodejs-env"
}

variable "solution_stack_name" {
  description = "The solution stack name for Elastic Beanstalk"
  type        = string
  # default     = "64bit Amazon Linux 2023 v6.1.7 running Node.js 20"
}

variable "vpc_id" {
  description = "The VPC ID for the environment"
  type        = string
  # default     = "vpc-077186d872275da74"
}

variable "subnet_ids" {
  description = "The subnet IDs for the environment"
  type        = list(string)
  # default     = ["subnet-013f140f645be7f4a,subnet-0d9424a953a9cc2c5"]
}

variable "elb_subnet_ids" {
  description = "The ELB subnet IDs for the environment"
  type        = list(string)
  # default = [ "subnet-06ef81d005e56255a,subnet-077922697b39d0782" ]
}

variable "iam_instance_profile" {
  description = "The IAM instance profile for Elastic Beanstalk"
  type        = string
}

variable "green_environment_name" {
  description = "The name of the Elastic Beanstalk environment"
  type        = string
  # default     = "green-nodejs-env"
}

variable "green_solution_stack_name" {
  description = "The solution stack name for Elastic Beanstalk"
  type        = string
  # default     = "64bit Amazon Linux 2 v5.9.4 running Node.js 16"
}

variable "notification_email" {
  description = "The email address to send CloudWatch alarm notifications to"
  type        = string
  # default     = "prashansa.joshi@adex.ltd"
}


variable "rds_credentials_secret_arn" {
  description = "The ARN of the Secrets Manager secret for the RDS credentials"
  type        = string
}
