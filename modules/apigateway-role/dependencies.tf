data "aws_iam_policy_document" "apigateway_assume_role_policy_document" {
  statement {
    actions = ["sts:AssumeRole"]
    effect  = "Allow"
    principals {
      identifiers = ["apigateway.amazonaws.com"]
      type        = "Service"
    }
  }
}

# This policy will allow the API Gateway to call Lambda functions.
data "aws_iam_policy_document" "apigateway_role_policy_document" {
  statement {
    actions   = ["lambda:InvokeFunction"]
    effect    = "Allow"
    resources = ["*"]
  }
}
