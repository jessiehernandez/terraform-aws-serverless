data "aws_iam_policy_document" "cloudformation_assume_role_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      identifiers = ["cloudformation.amazonaws.com"]
      type        = "Service"
    }
  }
}

data "aws_iam_policy_document" "cloudformation_role_policy_document" {
  ########################################
  # PASSING API GATEWAY AND LAMBDA ROLES #
  ########################################

  statement {
    actions = ["iam:PassRole"]
    effect  = "Allow"
    resources = concat(
      # API Gateway role
      ["arn:aws:iam::${var.aws_account_id}:role/${var.resource_prefix}-apiGatewayRole"],
      # Lambda function roles
      formatlist(
        "arn:aws:iam::${var.aws_account_id}:role/${var.resource_prefix}-%s-lambdaRole",
        var.function_names
      )
    )
  }

  #######
  # ACM #
  #######

  statement {
    actions   = ["acm:ListCertificates"]
    effect    = "Allow"
    resources = ["*"]
  }

  ###############
  # API GATEWAY #
  ###############

  statement {
    actions = [
      "apigateway:DELETE",
      "apigateway:GET",
      "apigateway:HEAD",
      "apigateway:OPTIONS",
      "apigateway:PATCH",
      "apigateway:POST",
      "apigateway:PUT",
      "apigateway:UpdateRestApiPolicy"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:apigateway:${var.aws_region}::/restapis",
      "arn:aws:apigateway:${var.aws_region}::/restapis/*"
    ]
  }

  statement {
    actions   = ["apigateway:POST"]
    effect    = "Allow"
    resources = ["arn:aws:apigateway:${var.aws_region}::/domainnames"]
  }

  statement {
    actions   = [
      "apigateway:GET",
      "apigateway:DELETE"
    ]
    effect    = "Allow"
    resources = ["arn:aws:apigateway:${var.aws_region}::/domainnames/*"]
  }

  statement {
    actions   = [
      "apigateway:PATCH",
      "apigateway:POST"
    ]
    effect    = "Allow"
    resources = [
      "arn:aws:apigateway:${var.aws_region}::/domainnames/*/basepathmappings",
      "arn:aws:apigateway:${var.aws_region}::/domainnames/*/basepathmappings/*",
    ]
  }

  ##################
  # CLOUDFORMATION #
  ##################

  statement {
    actions = [
      "cloudformation:CreateStack",
      "cloudformation:DeleteStack",
      "cloudformation:Describe*",
      "cloudformation:Get*",
      "cloudformation:List*",
      "cloudformation:PreviewStackUpdate",
      "cloudformation:UpdateStack"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:cloudformation:${var.aws_region}:${var.aws_account_id}:stack/${var.resource_prefix}-stack"
    ]
  }

  statement {
    actions   = ["cloudformation:ValidateTemplate"]
    effect    = "Allow"
    resources = ["*"]
  }

  ##############
  # CLOUDFRONT #
  ##############

  statement {
    actions  = ["cloudfront:UpdateDistribution"]
    effect   = "Allow"
    resources = ["*"]
  }

  ##############
  # CLOUDWATCH #
  ##############

  statement {
    actions   = ["logs:DescribeLogGroups"]
    effect    = "Allow"
    resources = ["arn:aws:logs:${var.aws_region}:${var.aws_account_id}:log-group::log-stream:*"]
  }

  # NOTE: the Serverless Framework currently does not support customizing the
  # name of the CloudWatch log groups for API Gateway. The current format is
  # serviceName-stage. We need to pass the application prefix for now.
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:DeleteLogGroup",
      "logs:DeleteLogStream",
      "logs:DescribeLogStreams",
      "logs:FilterLogEvents",
      "logs:PutRetentionPolicy"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:log-group:/aws/api-gateway/${var.sls_service_name}-${var.sls_stage}*:*",
      "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:log-group:/aws/api-gateway/${var.sls_service_name}-${var.sls_stage}-*:*:*",
      "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:log-group:/aws/lambda/${var.resource_prefix}*:*",
      "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:log-group:/aws/lambda/${var.resource_prefix}*:*:*"
    ]
  }

  statement {
    actions = [
      "events:DeleteRule",
      "events:DescribeRule",
      "events:PutRule",
      "events:PutTargets",
      "events:RemoveTargets"
    ]
    effect    = "Allow"
    resources = ["arn:aws:events:${var.aws_region}:${var.aws_account_id}:rule/${var.resource_prefix}*"]
  }

  #######
  # EC2 #
  #######

  statement {
    actions   = [
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeVpcs"
    ]
    effect    = "Allow"
    resources = ["*"]
  }

  #######
  # IAM #
  #######

  statement {
    actions   = ["iam:CreateServiceLinkedRole"]
    effect    = "Allow"
    resources = ["arn:aws:iam::${var.aws_account_id}:role/aws-service-role/ops.apigateway.amazonaws.com/AWSServiceRoleForAPIGateway"]
  }

  ##########
  # LAMBDA #
  ##########

  statement {
    actions = [
      "lambda:AddPermission",
      "lambda:CreateAlias",
      "lambda:CreateFunction",
      "lambda:DeleteAlias",
      "lambda:DeleteFunction",
      "lambda:GetFunction",
      "lambda:GetFunctionConfiguration",
      "lambda:InvokeFunction",
      "lambda:ListTags",
      "lambda:ListVersionsByFunction",
      "lambda:PublishVersion",
      "lambda:RemovePermission",
      "lambda:TagResource",
      "lambda:UntagResource",
      "lambda:UpdateAlias",
      "lambda:UpdateFunctionCode",
      "lambda:UpdateFunctionConfiguration"
    ]
    effect    = "Allow"
    resources = ["arn:aws:lambda:${var.aws_region}:${var.aws_account_id}:function:${var.resource_prefix}*"]
  }

  statement {
    actions = [
      "lambda:CreateEventSourceMapping",
      "lambda:ListEventSourceMappings"
    ]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    actions = [
      "lambda:DeleteEventSourceMapping",
      "lambda:GetEventSourceMapping",
      "lambda:UpdateEventSourceMapping"
    ]
    effect    = "Allow"
    resources = ["arn:aws:lambda:${var.aws_region}:${var.aws_account_id}:event-source-mapping:*"]
  }

  ############
  # ROUTE 53 #
  ############

  statement {
    actions   = ["route53:ListHostedZones"]
    effect    = "Allow"
    resources = ["*"]
  }

  dynamic "statement" {
    for_each = var.hosted_zone_ids

    content {
      actions   = [
        "route53:ChangeResourceRecordSets",
        "route53:GetHostedZone",
        "route53:ListResourceRecordSets"
      ]
      effect    = "Allow"
      resources = ["arn:aws:route53:::hostedzone/${statement.value}"]
    }
  }

  ######
  # S3 #
  ######

  statement {
    actions = ["s3:*"]
    effect  = "Allow"
    resources = [
      "arn:aws:s3:::${var.deployment_bucket_name}",
      "arn:aws:s3:::${var.deployment_bucket_name}/*",
    ]
  }

  statement {
    actions   = ["s3:ListAllMyBuckets"]
    effect    = "Allow"
    resources = ["*"]
  }
}
