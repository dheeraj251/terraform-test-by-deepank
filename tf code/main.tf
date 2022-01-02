# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

locals {
  tags = {
    Env = "Test"
    Project = "falcon"
    created_by = "Anurag Christopher"
  }
}