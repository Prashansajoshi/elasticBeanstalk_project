resource "aws_elastic_beanstalk_application" "app" {
  name        = var.application_name
  description = "Elastic Beanstalk application for my Node.js app"
}

resource "aws_s3_bucket" "eb_bucket" {
  bucket = "${var.application_name}-eb-bucket"
  acl    = "private"

  tags = {
    Name        = "${var.application_name}-eb-bucket"
    Environment = var.environment_name
  }
}

resource "aws_elastic_beanstalk_application_version" "app_version" {
  name        = "${var.application_name}-${var.environment_name}-v1" # Add this line to define the version name
  application = aws_elastic_beanstalk_application.app.name
  bucket      = aws_s3_bucket.eb_bucket.bucket
  key         = "app.zip" # Ensure your deployment package is named app.zip and uploaded to this bucket

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_elastic_beanstalk_environment" "env" {
  name                = var.environment_name
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = var.solution_stack_name
  cname_prefix        = "${var.application_name}-${var.environment_name}"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-06ef9b62d082af58b" # Replace with your VPC ID
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-0a013d264a5542da8,subnet-043b8d196be2f73ef" # Replace with your Subnet IDs
  }


  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.key_name
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = var.iam_instance_profile
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced" # or "SingleInstance"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_HOST"
    # value     = aws_db_instance.prashansa_private_db_instance.endpoint
    value = var.db_host
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_USER"
    value     = var.db_username
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_PASSWORD"
    value     = var.db_password
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_NAME"
    value     = var.database_name
  }
}

# resource "aws_iam_instance_profile" "eb_profile" {
#   name = "elastic-beanstalk-ec2-role"

#   role {
#     name = "aws-elasticbeanstalk-ec2-role"
#     managed_policy_arns = [
#       "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier",
#       "arn:aws:iam::aws:policy/AWSElasticBeanstalkMulticontainerDocker",
#       "arn:aws:iam::aws:policy/AWSElasticBeanstalkWorkerTier"
#     ]
#   }
# }
