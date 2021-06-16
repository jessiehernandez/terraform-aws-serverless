output "deployment_bucket_arn" {
  description = "ARN of the Serverless deployment bucket."
  value       = aws_s3_bucket.deployment_bucket.arn
}
