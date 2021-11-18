// This is the main region were the project will be deployed
provider "aws" {
  region = var.region
}

// This is the region for the ACM certificate
provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}
