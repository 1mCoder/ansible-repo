resource "aws_key_pair" "deployer" {
  key_name_prefix = "ukma-devops-"
  public_key = var.ssh_key_my
}