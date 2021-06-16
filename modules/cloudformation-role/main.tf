resource "aws_iam_role" "cloudformation_role" {
  assume_role_policy = data.aws_iam_policy_document.cloudformation_assume_role_policy_document.json
  name               = "${var.resource_prefix}-cfRole"
  tags               = var.tags
}

resource "aws_iam_role_policy" "cloudformation_role_policy" {
  name   = "${var.resource_prefix}-cfPolicy"
  role   = aws_iam_role.cloudformation_role.id
  policy = data.aws_iam_policy_document.cloudformation_role_policy_document.json
}
