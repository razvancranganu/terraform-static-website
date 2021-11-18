module "route53" {
  source      = "./module/route53"
  domain_name = var.domain_name
}
