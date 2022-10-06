resource "aws_instance" "instance1" {
  ami                    = var.ami_ubuntu
  instance_type          = var.micro
  availability_zone      = var.zoneA
  subnet_id              = var.subnets_id[0]
  key_name               = var.ssh_key
  user_data              = file(var.docker_config_file)
  vpc_security_group_ids = [var.sg_id]
  tags = {
    name       = "${var.ec2_name}${1}"
    created_by = "Piotr Piasecki"
    bootcamp   = "poland1"
  }
  volume_tags = var.tags
}

resource "aws_instance" "instance2" {
  ami                    = var.ami_ubuntu
  instance_type          = var.micro
  availability_zone      = var.zoneB
  subnet_id              = var.subnets_id[1]
  key_name               = var.ssh_key
  user_data              = file(var.docker_config_file)
  vpc_security_group_ids = [var.sg_id]
  tags = {
    name       = "${var.ec2_name}${2}"
    created_by = "Piotr Piasecki"
    bootcamp   = "poland1"
  }
  volume_tags = var.tags
}