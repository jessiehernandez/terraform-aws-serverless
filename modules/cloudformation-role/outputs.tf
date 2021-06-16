output "role_arn" {
  description = "ARN of the CloudFormation IAM role."
  value       = aws_iam_role.cloudformation_role.arn
}
