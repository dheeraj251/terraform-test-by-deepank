resource "aws_security_group" "falcon_ec2_sg" {
  name        = "falcon-ec2-sg"
  description = "Access to falcon ec2 instance"
  vpc_id      = aws_vpc.falcon_vpc.id

  tags = merge(
  { "Name" = "falcon-ec2-sg"},
  local.tags)
}

resource "aws_security_group_rule" "egress_all" {
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.falcon_ec2_sg.id
  to_port           = 65535
  type              = "egress"
  cidr_blocks = ["0.0.0.0/0"]
  description = "Allow access to outbound traffic"
}

resource "aws_security_group_rule" "ingress_allow_http" {
  from_port         = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.falcon_ec2_sg.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks = ["0.0.0.0/0"]
  description = "Allow ingress to port 80"
}