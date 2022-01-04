# Create a VPC
resource "aws_vpc" "falcon_vpc" {
  cidr_block = var.vpc_cidr
  tags = merge(
    { "Name" = "${var.project}-vpc" },
  local.tags)
}

resource "aws_internet_gateway" "falcon_igw" {
  vpc_id = aws_vpc.falcon_vpc.id

  tags = merge(
    { "Name" = "${var.project}-igw" },
  local.tags)
}

resource "aws_subnet" "falcon_sn_1" {
  vpc_id     = aws_vpc.falcon_vpc.id
  cidr_block = var.public_subnet

  tags = merge(
    { "Name" = "${var.project}-sn-1" },
  local.tags)
}

resource "aws_route_table" "falcon_pub_rt" {
  vpc_id = aws_vpc.falcon_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.falcon_igw.id
  }

  tags = merge(
    { "Name" = "${var.project}-pub-rt" },
  local.tags)
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.falcon_sn_1.id
  route_table_id = aws_route_table.falcon_pub_rt.id
}