data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "s3" {
  statement {
    sid = "PublicReadGetObject"
    # principals {
    #   type        = "AWS"
    #   identifiers = [data.aws_caller_identity.current.account_id]
    # }
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}"
    ]
  }
}

resource "aws_iam_policy" "s3" {
  name   = "s3_policy"
  path   = "/"
  policy = data.aws_iam_policy_document.s3.json
}
