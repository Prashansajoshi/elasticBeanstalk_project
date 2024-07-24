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
    value     = "vpc-077186d872275da74" # Replace with your VPC ID
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-013f140f645be7f4a,subnet-0d9424a953a9cc2c5" # Replace with your Subnet IDs
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "public" # or "internal" depending on your setup
  }

    setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "subnet-06ef81d005e56255a,subnet-077922697b39d0782" # or "internal" depending on your setup
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = var.security_group_id
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
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_HOST"
    # value     = aws_db_instance.prashansa_private_db_instance.endpoint
    value     = var.db_host
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

resource "aws_sns_topic" "alarm_topic" {
  name = "${var.application_name}-alarm-topic"
}

resource "aws_sns_topic_subscription" "alarm_subscription" {
  topic_arn = aws_sns_topic.alarm_topic.arn
  protocol  = "email"
  endpoint  = var.notification_email
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_alarm" {
  alarm_name          = "${var.application_name}-${var.environment_name}-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ElasticBeanstalk"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors EC2 CPU utilization"
  alarm_actions       = [aws_sns_topic.alarm_topic.arn]

  dimensions = {
    EnvironmentName = aws_elastic_beanstalk_environment.env.name
  }
}

resource "aws_cloudwatch_metric_alarm" "green_high_cpu_alarm" {
  alarm_name          = "${var.application_name}-${var.green_environment_name}-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ElasticBeanstalk"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "This metric monitors EC2 CPU utilization"
  alarm_actions       = [aws_sns_topic.alarm_topic.arn]

  dimensions = {
    EnvironmentName = aws_elastic_beanstalk_environment.green_env.name
  }
}






resource "aws_elastic_beanstalk_application_version" "green_app_version" {
  name        = "${var.application_name}-${var.green_environment_name}-v1" # Add this line to define the version name
  application = aws_elastic_beanstalk_application.app.name
  bucket      = data.aws_s3_bucket.existing_bucket.bucket
  key         = "app.zip" # Ensure your deployment package is named app.zip and uploaded to this bucket

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_elastic_beanstalk_environment" "green_env" {
  name                = var.green_environment_name
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = var.green_solution_stack_name
  cname_prefix        = "${var.application_name}-${var.green_environment_name}"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-077186d872275da74" # Replace with your VPC ID
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-013f140f645be7f4a,subnet-0d9424a953a9cc2c5" # Replace with your Subnet IDs
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBScheme"
    value     = "public" # or "internal" depending on your setup
  }

    setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "subnet-06ef81d005e56255a,subnet-077922697b39d0782" # or "internal" depending on your setup
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = var.security_group_id
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
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "DB_HOST"
    # value     = aws_db_instance.prashansa_private_db_instance.endpoint
    value     = var.db_host
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
