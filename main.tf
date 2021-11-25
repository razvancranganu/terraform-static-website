module "route53" {
  source      = "./module/route53"
  domain_name = var.domain_name
}

# module "iam_policy" {
#   source         = "./module/iam_policy"
#   s3_bucket_name = "${terraform.workspace}-${var.bucket_name}"
# }

module "s3" {
  source      = "./module/s3"
  bucket_name = "${terraform.workspace}-${var.bucket_name}"
  # iam_policy  = module.iam_policy.iam_policy_name
  domain_name = var.domain_name
  common_tags = var.common_tags
}
