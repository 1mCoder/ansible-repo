output "instance_ips" {
  value = aws_instance.terraform-server[*].public_ip
}