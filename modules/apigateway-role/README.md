# Serverless API Gateway IAM Role

This module creates the IAM role that will be assumed by the API Gateway that is
created from the Serverless Framework.

## Contents

* [Requirements](#requirements)
* [Providers](#providers)
* [Resources](#resources)
* [Inputs](#inputs)
* [Outputs](#outputs)
* [Usage](#usage)
* [Author(s)](#authors)

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.apigateway_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.apigateway_role_cloudwatch_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.apigateway_access_to_cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_prefix"></a> [resource\_prefix](#input\_resource\_prefix) | Prefix to use when naming resources, such as log groups and IAM roles. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tag pairs to apply to the role. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | ARN of the API Gateway IAM role. |

## Usage

Normally, the main serverless module will be used instead of directly
referencing this module. If only the API Gateway IAM role is desired, though,
the module can be called as follows:

```
module "apigateway_role" {
  source  = "jessiehernandez/serverless/aws/apigateway-role"
  version = "1.0.0"

  resource_prefix = "mycompany-dev"
  tags = {
    Environment = "dev"
  }
}
```

## Author(s)

Module was created by `Jessie Hernandez`.
