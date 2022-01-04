# Configure the AWS Provider
provider "aws" {
  region = var.region
}

locals {
  tags = {
    Env        = "Test"
    Project    = "falcon"
    created_by = "Anurag Christopher"
  }
}