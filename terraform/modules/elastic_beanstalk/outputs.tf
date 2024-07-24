output "application_name" {
  value = aws_elastic_beanstalk_application.app.name
}

output "environment_url" {
  value = aws_elastic_beanstalk_environment.env.endpoint_url
}


output "green_environment_url" {
  value = aws_elastic_beanstalk_environment.green_env.endpoint_url
}

output "s3_bucket_name" {
  value = data.aws_s3_bucket.existing_bucket
}