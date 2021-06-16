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

variable "names" {
  description = "The names of the Lambda functions."
  type        = list(string)
}

variable "prefix" {
  description = "Prefix to use for function role names."
  type        = string
}
