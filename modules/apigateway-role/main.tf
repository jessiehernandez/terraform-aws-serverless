resource "aws_iam_role" "apigateway_role" {
  assume_role_policy = data.aws_iam_policy_document.apigateway_assume_role_policy_document.json
  name               = "${var.resource_prefix}-apiGatewayRole"
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "apigateway_access_to_cloudwatch" {
  role       = aws_iam_role.apigateway_role.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonAPIGatewayPushToCloudWatchLogs"
}

resource "aws_iam_role_policy" "apigateway_role_cloudwatch_policy" {
  name   = "AllowApiGatewayToInvokeLambdaFunctions"
  role   = aws_iam_role.apigateway_role.id
  policy = data.aws_iam_policy_document.apigateway_role_policy_document.json
}
