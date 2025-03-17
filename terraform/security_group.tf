resource "aws_security_group" "firewall" {
  name        = "terraform-firewall"
  description = "Security group for Terraform servers"
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.firewall.id
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_trafic_ipv4" {
  security_group_id = aws_security_group.firewall.id
  ip_protocol = "-1"
  cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_trafic_ipv6" {
  security_group_id = aws_security_group.firewall.id
  cidr_ipv6 = "::/0"
  ip_protocol = "-1"
}

resource "aws_security_group_rule" "allow_postgres_internal" {
  security_group_id = aws_security_group.firewall.id
  type              = "ingress"
  from_port         = 5432
  to_port           = 5435
  protocol         = "tcp"
  source_security_group_id = aws_security_group.firewall.id
}