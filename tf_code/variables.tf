variable "project" {
  description = "Project Name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR of VPC"
  type        = string
}

variable "public_subnet" {
  description = "CIDR of Public Subnet"
  type        = string
}

variable "whitelist_ip" {
  description = "IP to be white listed"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
}
