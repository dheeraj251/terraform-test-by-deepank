# Create a VPC
resource "aws_vpc" "falcon_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = merge(
  { "Name" = "falcon-vpc" },
  local.tags)
}

resource "aws_internet_gateway" "falcon_igw" {
  vpc_id = aws_vpc.falcon_vpc.id

  tags = merge(
  { "Name" = "falcon-igw"},
          local.tags)
}

resource "aws_subnet" "falcon_sn_1" {
  vpc_id     = aws_vpc.falcon_vpc.id
  cidr_block = "10.0.1.0/24"

  tags = merge(
  { "Name" = "falcon-sn-1"},
  local.tags)
  }

resource "aws_route_table" "falcon_pub_rt" {
  vpc_id = aws_vpc.falcon_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.falcon_igw.id
  }

  tags = merge(
  { "Name" = "falcon-pub-rt"},
  local.tags)
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.falcon_sn_1.id
  route_table_id = aws_route_table.falcon_pub_rt.id
}