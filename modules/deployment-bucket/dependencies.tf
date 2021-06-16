data "aws_iam_policy_document" "deployment_bucket_policy_document" {
  # Force HTTPS to be used for all access to this bucket
  statement {
    actions = [
      "s3:*"
    ]
    condition {
      test     = "Bool"
      variable = "aws:SecureTransport"
      values   = ["false"]
    }
    effect = "Deny"
    principals {
      identifiers = ["*"]
      type        = "*"
    }
    resources = [
      aws_s3_bucket.deployment_bucket.arn,
      "${aws_s3_bucket.deployment_bucket.arn}/*"
    ]
  }
}
