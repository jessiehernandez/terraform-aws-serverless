output "roles" {
  description = "ARN to the Lambda function IAM roles."
  value       = aws_iam_role.lambda_function_role
}
