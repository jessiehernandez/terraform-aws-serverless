# Serverless CloudFormation IAM Role

This module creates the IAM role that will be assumed by CloudFormation after
the Serverless Framework creates a stack for a project and deploys it.

## Contents

* [Requirements](#requirements)
* [Providers](#providers)
* [Resources](#resources)
* [Inputs](#inputs)
* [Outputs](#outputs)
* [Author(s)](#authors)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.cloudformation_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.cloudformation_role_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account ID. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to deploy resources to. | `string` | n/a | yes |
| <a name="input_deployment_bucket_name"></a> [deployment\_bucket\_name](#input\_deployment\_bucket\_name) | The name of the S3 bucket that will be used by Serverless deployments. | `string` | n/a | yes |
| <a name="input_function_names"></a> [function\_names](#input\_function\_names) | The list of the *un-prefixed* function names that will be defined later on. This is needed to allow CloudFormation to pass the roles to these functions. | `list(string)` | n/a | yes |
| <a name="input_hosted_zone_ids"></a> [hosted\_zone\_ids](#input\_hosted\_zone\_ids) | List of hosted zone IDs that will be managed by this deployment. | `list(string)` | `[]` | no |
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Prefix to use when naming resources, such as CloudFormation stacks and IAM roles. | `string` | n/a | yes |
| <a name="input_sls_service_name"></a> [sls\_service\_name](#input\_sls\_service\_name) | The name of the service as defined by the Serverless Framework. | `string` | n/a | yes |
| <a name="input_sls_stage"></a> [sls\_stage](#input\_sls\_stage) | The name of the stage that is being deployed by the Serverless Framework. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag pairs to apply to the role. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | ARN of the CloudFormation IAM role. |

## Author(s)

Module was created by `Jessie Hernandez`.
