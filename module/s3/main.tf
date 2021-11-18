resource "aws_s3_bucket" "www_bucket" {
  bucket = var.bucket_name
  acl    = "public-read"

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
