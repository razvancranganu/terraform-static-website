data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "s3" {
  statement {
    sid = "PublicReadGetObject"

    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
      # identifiers = "*"
    }
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::${var.bucket_name}/*"
    ]
  }
}

resource "aws_s3_bucket" "www_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"
  # policy = var.iam_policy
  policy = data.aws_iam_policy_document.s3.json

  cors_rule {
    allowed_headers = ["Authorization", "Content-Length"]
    allowed_methods = ["GET", "POST"]
    allowed_origins = ["https://www.${var.domain_name}"]
    max_age_seconds = 3600
  }

  website {
    index_document = "index.html"
    error_document = "404.html"
  }

  tags = var.common_tags
}

resource "aws_s3_bucket_object" "www_bucket_object" {
  key     = "www_key_id"
  bucket  = aws_s3_bucket.www_bucket.id
  content = "text/html"
}
