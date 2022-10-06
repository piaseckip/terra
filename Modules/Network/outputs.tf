output "subnets_list" {
  description = "subnets list"
  value       = [aws_subnet.my_subnet.id, aws_subnet.my_subnet2.id]
}

output "vpc id" {
  value = aws_vpc.main_vpc.id
}

output "sg_group_id" {
  value = aws_security_group.tf-alb_sg.id
}