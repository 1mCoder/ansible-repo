data "aws_ami" "ubuntu-24" {
    most_recent =  true

    filter {
      name = "name"
      values = ["ubuntu-minimal/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-*"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }

    owners = ["099720109477"]
}