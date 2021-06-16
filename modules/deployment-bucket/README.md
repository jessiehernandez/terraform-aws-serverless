# Serverless S3 Deployment Bucket

This module creates the S3 bucket that will be used by the Serverless Framework
during deployments. Deployments older than 30 days will automatically be deleted.

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
| [aws_s3_bucket.deployment_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.deployment_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.deployment_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_deployment_bucket_name"></a> [deployment\_bucket\_name](#input\_deployment\_bucket\_name) | The name of the S3 bucket that will be used by Serverless deployments. | `string` | n/a | yes |
| <a name="input_s3_logging_bucket_name"></a> [s3\_logging\_bucket\_name](#input\_s3\_logging\_bucket\_name) | Name of the S3 bucket which should receive the S3 logs. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag pairs to apply to the S3 deployment bucket. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_deployment_bucket_arn"></a> [deployment\_bucket\_arn](#output\_deployment\_bucket\_arn) | ARN of the Serverless deployment bucket. |

## Author(s)

Module was created by `Jessie Hernandez`.
