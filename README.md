# AWS Serverless Framework Facilitator

This main module enables resources managed by the [Serverless Framework](https://www.serverless.com)
to be securely deployed to AWS. Only the least amount of permissions are granted
to the individual IAM roles used by Serverless. Additional permissions can be
granted by attaching role policies to the created roles.

## Contents

* [Requirements](#requirements)
* [Providers](#providers)
* [Modules](#modules)
* [Resources](#resources)
* [Inputs](#inputs)
* [Outputs](#outputs)
* [Author(s)](#authors)

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_apigateway_role"></a> [apigateway\_role](#module\_apigateway\_role) | ./modules/apigateway-role | n/a |
| <a name="module_cloudformation_role"></a> [cloudformation\_role](#module\_cloudformation\_role) | ./modules/cloudformation-role | n/a |
| <a name="module_deployment_bucket"></a> [deployment\_bucket](#module\_deployment\_bucket) | ./modules/deployment-bucket | n/a |
| <a name="module_function_roles"></a> [function\_roles](#module\_function\_roles) | ./modules/function-roles | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account ID. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to deploy resources to. | `string` | n/a | yes |
| <a name="input_deployment_bucket_name"></a> [deployment\_bucket\_name](#input\_deployment\_bucket\_name) | The name of the S3 bucket that will be used by Serverless deployments. | `string` | n/a | yes |
| <a name="input_function_names"></a> [function\_names](#input\_function\_names) | The list of the *un-prefixed* function names that will be defined later on. This is needed to allow CF to pass the roles to these functions. | `list(string)` | n/a | yes |
| <a name="input_hosted_zone_ids"></a> [hosted\_zone\_ids](#input\_hosted\_zone\_ids) | List of hosted zone IDs that will be managed by this deployment. | `list(string)` | `[]` | no |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Prefix to use when naming resources, such as log groups and IAM roles. | `string` | n/a | yes |
| <a name="input_s3_logging_bucket_name"></a> [s3\_logging\_bucket\_name](#input\_s3\_logging\_bucket\_name) | Name of the S3 bucket which should receive the S3 logs. | `string` | n/a | yes |
| <a name="input_sls_service_name"></a> [sls\_service\_name](#input\_sls\_service\_name) | The name of the service as defined by the Serverless Framework. | `string` | n/a | yes |
| <a name="input_sls_stage"></a> [sls\_stage](#input\_sls\_stage) | The name of the stage that is being deployed by the Serverless Framework. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Common tag pairs to apply to the resources. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_apigateway_role_arn"></a> [apigateway\_role\_arn](#output\_apigateway\_role\_arn) | ARN of the API Gateway IAM role. |
| <a name="output_cloudformation_role_arn"></a> [cloudformation\_role\_arn](#output\_cloudformation\_role\_arn) | ARN of the CloudFormation IAM role. |
| <a name="output_deployment_bucket_arn"></a> [deployment\_bucket\_arn](#output\_deployment\_bucket\_arn) | ARN of the Serverless deployment bucket. |
| <a name="output_function_roles"></a> [function\_roles](#output\_function\_roles) | Lambda function role ARNs. |

## Author(s)

Module was created by `Jessie Hernandez`.
