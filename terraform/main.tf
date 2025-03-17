resource "aws_instance" "terraform-server" {
  count         = 2
  ami           = data.aws_ami.ubuntu-24.id
  instance_type = var.instance_type
  key_name      = aws_key_pair.deployer.key_name

  security_groups = [ aws_security_group.firewall.name ]

  user_data = <<-EOF
    #!/bin/bash
    echo "${var.ssh_key_user}" >> /home/ubuntu/.ssh/authorized_keys
    chown ubuntu:ubuntu /home/ubuntu/.ssh/authorized_keys
    chmod 600 /home/ubuntu/.ssh/authorized_keys
  EOF

  tags = {
    Name = "Terraform-Server-${count.index + 1}"
  }
}
