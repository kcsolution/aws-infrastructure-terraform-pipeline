terraform {
  backend "s3" {
    encrypt = "true"
    bucket  = "terraform-state-nexus-zarp"
    region  = "us-east-2"
    key     = "environment/production/terraform.tfstate"
  }
}

provider "aws" {
  region                  = "${var.region}"
  shared_credentials_file = "${var.shared_credentials_file}"
  profile                 = "${var.aws_profile}"
}
