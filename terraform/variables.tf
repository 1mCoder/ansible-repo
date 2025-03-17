variable "aws_region" {
  description = "AWS Region"
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "Тип EC2 інстансу"
  default     = "t3.micro"
}

variable "ssh_key_my" {
  description = "Мій SSH ключ"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICqvES9xrvoY+k+NF3NMp28uqLlbu7HfeR8aiNqFP17p"
}

variable "ssh_key_user" {
  description = "SSH ключ іншого користувача"
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOkAhvfRyUvgsUwENIds1a/4OvuHQgLki8K1EzPltl5M"
}