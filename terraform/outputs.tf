output "eb_application_name" {
  value = module.elastic_beanstalk.application_name
}

output "eb_environment_url" {
  value = module.elastic_beanstalk.environment_url
}

output "environment_url" {
  description = "The URL of the Elastic Beanstalk environment"
  value       = module.elastic_beanstalk.environment_url
}
