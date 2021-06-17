# Serverless Lambda Function IAM Role Creator

This module creates an IAM role for each Lambda function that is created as part
of a Serverless Framework deployment. Each Serverless Framework function can be
configured to use its specific IAM role by filling the `role` property with the
role ARN, as described in https://www.serverless.com/framework/docs/providers/aws/guide/iam#custom-iam-roles-for-each-function .

The role created will only have the minimum permissions needed for CloudWatch
logs, permissions to run inside a VPC and permissions to emit X-Ray traces.
Additional permissions can be added to the role by attaching extra role policies.

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
| [aws_iam_role.lambda_function_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.lambda_function_cloudwatch_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_account_id"></a> [aws\_account\_id](#input\_aws\_account\_id) | AWS account ID. | `string` | n/a | yes |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region to deploy resources to. | `string` | n/a | yes |
| <a name="input_names"></a> [names](#input\_names) | The names of the Lambda functions. | `list(string)` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix to use for function role names. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_roles"></a> [roles](#output\_roles) | ARN to the Lambda function IAM roles. |

## Author(s)

Module was created by `Jessie Hernandez`.
