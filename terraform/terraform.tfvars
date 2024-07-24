iam_instance_profile = "elastic-beanstalk-ec2-role"

vpc_cidr = "10.0.0.0/16"

subnet_cidr = "10.0.1.0/24"

subnet_cidr_public_2 = "10.0.2.0/24"

subnet_cidr_private_1 = "10.0.3.0/24"

subnet_cidr_private_2 = "10.0.4.0/24"

database_subnet_1_cidr = "10.0.101.0/24"

database_subnet_2_cidr = "10.0.102.0/24"

all_cidr_block = "0.0.0.0/0"

ami = "ami-04b70fa74e45c3917"

instance_type = "t2.micro"

key_name = "prashansa-lambda"

availability_zone_1 = "us-east-1a"

availability_zone_2 = "us-east-1b"

bucket_name = "prashansa-s3-bucket"

acl = "private"

versioning = false

tags = {}

block_public_acls = true

block_public_policy = false

ignore_public_acls = true

restrict_public_buckets = true

database_name = "testdb"

db_username = "testuser"

db_password = "test0000"

application_name = "my-nodejs-app"

environment_name = "my-nodejs-env"

solution_stack_name = "64bit Amazon Linux 2023 v6.1.7 running Node.js 20"

vpc_id = "vpc-077186d872275da74"

subnet_ids = ["subnet-013f140f645be7f4a", "subnet-0d9424a953a9cc2c5"]

elb_subnet_ids = ["subnet-06ef81d005e56255a", "subnet-077922697b39d0782"]

green_environment_name = "green-nodejs-env"

green_solution_stack_name = "64bit Amazon Linux 2 v5.9.4 running Node.js 16"

notification_email = "prashansa.joshi@adex.ltd"

rds_credentials_secret_arn = "arn:aws:secretsmanager:us-east-1:426857564226:secret:rds-credentials-5f2KZ9"