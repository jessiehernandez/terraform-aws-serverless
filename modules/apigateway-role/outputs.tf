output "role_arn" {
  description = "ARN of the API Gateway IAM role."
  value       = aws_iam_role.apigateway_role.arn
}
