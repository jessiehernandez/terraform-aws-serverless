module "apigateway_role" {
  source = "./modules/apigateway-role"

  resource_prefix = var.resource_prefix
  tags            = var.tags
}

module "cloudformation_role" {
  source = "./modules/cloudformation-role"

  aws_account_id         = var.aws_account_id
  aws_region             = var.aws_region
  deployment_bucket_name = var.deployment_bucket_name
  function_names         = var.function_names
  hosted_zone_ids        = var.hosted_zone_ids
  resource_prefix        = var.resource_prefix
  sls_service_name       = var.sls_service_name
  sls_stage              = var.sls_stage
  tags                   = var.tags
}

module "deployment_bucket" {
  source = "./modules/deployment-bucket"

  deployment_bucket_name = var.deployment_bucket_name
  s3_logging_bucket_name = var.s3_logging_bucket_name
  tags                   = var.tags
}

module "function_roles" {
  source = "./modules/function-roles"

  aws_account_id = var.aws_account_id
  aws_region     = var.aws_region
  names          = var.function_names
  prefix         = var.resource_prefix != "" ? "${var.resource_prefix}-" : ""
}
