output "apigateway_role_arn" {
  description = "ARN of the API Gateway IAM role."
  value       = module.apigateway_role.role_arn
}

output "cloudformation_role_arn" {
  description = "ARN of the CloudFormation IAM role."
  value       = module.cloudformation_role.role_arn
}

output "deployment_bucket_arn" {
  description = "ARN of the Serverless deployment bucket."
  value       = module.deployment_bucket.deployment_bucket_arn
}

output "function_roles" {
  description = "Lambda function role ARNs."
  value       = module.function_roles.roles
}
