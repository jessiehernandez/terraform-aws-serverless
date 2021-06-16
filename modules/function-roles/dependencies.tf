data "aws_kms_alias" "lambda" {
  name = "alias/aws/lambda"
}

data "aws_iam_policy_document" "lambda_assume_role_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      identifiers = [
        "apigateway.amazonaws.com",
        "lambda.amazonaws.com"
      ]
      type = "Service"
    }
  }
}

# This policy will allow the Lambda function to write to CloudWatch, but only to
# a specific log group for this function
data "aws_iam_policy_document" "lambda_function_cloudwatch_policy_document" {
  for_each = zipmap(var.names, var.names)

  ##############
  # CLOUDWATCH #
  ##############

  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:log-group:/aws/lambda/${var.prefix}${each.value}",
      "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:log-group:/aws/lambda/${var.prefix}${each.value}:*",
      "arn:aws:logs:${var.aws_region}:${var.aws_account_id}:log-group:/aws/lambda/${var.prefix}${each.value}:*:*"
    ]
  }

  #######
  # EC2 #
  #######

  statement {
    actions   = [
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface"
    ]
    effect    = "Allow"
    resources = ["*"]
    sid       = "AllowRunningInsideAVpc"
  }

  #######
  # KMS #
  #######

  statement {
    actions = [
      "kms:Decrypt"
    ]
    effect  = "Allow"
    resources = [
      "arn:aws:kms:${var.aws_region}:${var.aws_account_id}:alias/aws/lambda",
      data.aws_kms_alias.lambda.target_key_arn
    ]
  }

  #########
  # X-RAY #
  #########

  statement {
    actions   = [
      "xray:PutTraceSegments",
      "xray:PutTelemetryRecords",
      "xray:GetSamplingRules",
      "xray:GetSamplingTargets",
      "xray:GetSamplingStatisticSummaries"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}
