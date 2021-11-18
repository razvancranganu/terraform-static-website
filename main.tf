module "route53" {
  source      = "./module/route53"
  domain_name = var.domain_name
}

module "s3" {
  source      = "./module/s3"
  bucket_name = "${terraform.workspace}-${var.bucket_name}"
  domain_name = var.domain_name
  common_tags = var.common_tags
}
