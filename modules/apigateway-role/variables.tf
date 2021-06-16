# ------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# ------------------------------------------------------------------------------

variable "resource_prefix" {
  description = "Prefix to use when naming resources, such as log groups and IAM roles."
  type        = string
}

variable "tags" {
  default     = {}
  description = "Tag pairs to apply to the role."
  type        = map(string)
}
