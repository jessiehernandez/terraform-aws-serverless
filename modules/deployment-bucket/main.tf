# Deployment bucket for the Serverless framework
resource "aws_s3_bucket" "deployment_bucket" {
  acl    = "log-delivery-write"
  bucket = var.deployment_bucket_name
  tags = merge({
    Name = "Serverless Deployment Bucket"
  }, var.tags)

  # Automatically delete deployments older than 30 days
  lifecycle_rule {
    id      = "delete-old-deployments"
    enabled = true
    prefix  = "serverless/"

    expiration {
      days = 30
    }
  }

  logging {
    target_bucket = var.s3_logging_bucket_name
    target_prefix = "${var.deployment_bucket_name}/"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "aws:kms"
      }
    }
  }

  versioning {
    enabled = true
  }
}

# Policy for the deployment bucket
resource "aws_s3_bucket_policy" "deployment_bucket_policy" {
  bucket = aws_s3_bucket.deployment_bucket.id
  policy = data.aws_iam_policy_document.deployment_bucket_policy_document.json
}

resource "aws_s3_bucket_public_access_block" "deployment_bucket" {
  block_public_acls       = true
  block_public_policy     = true
  bucket                  = aws_s3_bucket.deployment_bucket.id
  ignore_public_acls      = true
  restrict_public_buckets = true
}
