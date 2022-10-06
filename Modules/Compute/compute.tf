resource "aws_instance" "instance1" {
  ami                    = var.ami-ubuntu
  instance_type          = var.micro
  availability_zone      = var.zoneA
  subnet_id              = aws_subnet.my_subnet.id
  key_name               = var.ssh-key
  user_data              = file(var.docker-config-file)
  vpc_security_group_ids = [aws_security_group.tf-alb_sg.id]
  tags                   = {
    name = "${var.ec2_name}${1}"
    created_by = "Piotr Piasecki"
    bootcamp   = "poland1"
  } 
  volume_tags            = var.tags
}

resource "aws_instance" "instance2" {
  ami                    = var.ami-ubuntu
  instance_type          = var.micro
  availability_zone      = var.zoneB
  subnet_id              = aws_subnet.my_subnet2.id
  key_name               = var.ssh-key
  user_data              = file(var.docker-config-file)
  vpc_security_group_ids = [aws_security_group.tf-alb_sg.id]
  tags                   = {
    name = "${var.ec2_name}${2}"
    created_by = "Piotr Piasecki"
    bootcamp   = "poland1"
  } 
  volume_tags            = var.tags
}