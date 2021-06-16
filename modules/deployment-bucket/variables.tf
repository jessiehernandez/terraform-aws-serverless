# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ------------------------------------------------------------------------------

variable "deployment_bucket_name" {
  description = "The name of the S3 bucket that will be used by Serverless deployments."
  type        = string
}

variable "s3_logging_bucket_name" {
  description = "Name of the S3 bucket which should receive the S3 logs."
  type        = string
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ------------------------------------------------------------------------------

variable "tags" {
  default     = {}
  description = "Tag pairs to apply to the S3 deployment bucket."
  type        = map(string)
}
