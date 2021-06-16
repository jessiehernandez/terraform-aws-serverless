# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ------------------------------------------------------------------------------

variable "aws_account_id" {
  description = "AWS account ID."
  type        = string
}

variable "aws_region" {
  description = "AWS region to deploy resources to."
  type        = string
}

variable "deployment_bucket_name" {
  description = "The name of the S3 bucket that will be used by Serverless deployments."
  type        = string
}

variable "function_names" {
  description = "The list of the *un-prefixed* function names that will be defined later on. This is needed to allow CloudFormation to pass the roles to these functions."
  type        = list(string)
}

variable "resource_prefix" {
  description = "Prefix to use when naming resources, such as CloudFormation stacks and IAM roles."
  type        = string
}

variable "sls_service_name" {
  description = "The name of the service as defined by the Serverless Framework."
  type        = string
}

variable "sls_stage" {
  description = "The name of the stage that is being deployed by the Serverless Framework."
  type        = string
}

# ------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# ------------------------------------------------------------------------------

variable "hosted_zone_ids" {
  default     = []
  description = "List of hosted zone IDs that will be managed by this deployment."
  type        = list(string)
}

variable "tags" {
  default     = {}
  description = "Tag pairs to apply to the role."
  type        = map(string)
}
