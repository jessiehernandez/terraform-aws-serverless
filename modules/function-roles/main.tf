# Each Lambda function will have its own unique role
resource "aws_iam_role" "lambda_function_role" {
  # Create a map so that we can refer to functions by name in the output
  for_each = zipmap(var.names, var.names)

  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role_policy_document.json
  name               = "${var.prefix}${each.key}-lambdaRole"
}

# This policy allows this Lambda function to write to its own CloudWatch log group
resource "aws_iam_role_policy" "lambda_function_cloudwatch_policy" {
  for_each = zipmap(var.names, var.names)

  name   = "AllowFunctionAccessToServices"
  role   = aws_iam_role.lambda_function_role[each.value].id
  policy = data.aws_iam_policy_document.lambda_function_cloudwatch_policy_document[each.value].json
}
