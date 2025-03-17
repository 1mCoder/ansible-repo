resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory.ini"
  content  = templatefile("${path.module}/inventory.tpl", {
    master_ip = aws_instance.terraform-server[0].public_ip
    slave_ip  = aws_instance.terraform-server[1].public_ip
  })
}

resource "local_file" "master_vars" {
  filename = "${path.module}/../ansible/group_vars/master.yml"
  content  = <<EOT
master_address: "${aws_instance.terraform-server[0].private_ip}"
EOT
}

resource "local_file" "slave_vars" {
  filename = "${path.module}/../ansible/group_vars/slave.yml"
  content  = <<EOT
slave_address: "${aws_instance.terraform-server[1].private_ip}"
EOT
}
