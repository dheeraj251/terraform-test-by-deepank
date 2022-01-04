output "vpc_id" {
  description = "vpc id of deployed infrastructure"
  value       = aws_vpc.falcon_vpc.id
}

output "subnet_id" {
  description = "subnet id of deployed public subnet"
  value       = aws_subnet.falcon_sn_1.id
}

output "security_group_id" {
  description = "security id of ec2 instance"
  value       = aws_security_group.falcon_ec2_sg.id
}

output "ec2_instance_id" {
  description = "instance id of ec2 instance"
  value       = aws_instance.falcon_web.id
}

output "ec2_public_ip" {
  description = "public ip of provisioned ec2 instance"
  value       = aws_instance.falcon_web.public_ip
}
