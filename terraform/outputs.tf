output "master" {
  value = {
    public_ip  = aws_instance.terraform-server[0].public_ip
    private_ip = aws_instance.terraform-server[0].private_ip
    public_dns = aws_instance.terraform-server[0].public_dns
  }
}

output "slave" {
  value = {
    public_ip  = aws_instance.terraform-server[1].public_ip
    private_ip = aws_instance.terraform-server[1].private_ip
    public_dns = aws_instance.terraform-server[1].public_dns
  }
}
