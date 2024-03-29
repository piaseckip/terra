resource "aws_lb" "alb" {
  name                       = "Piotrek-tf-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.sg_id]
  subnets                    = [var.subnets_id[0], var.subnets_id[1]]
  enable_deletion_protection = false
  tags = {
    Name = "Piotrek-tf-alb"
  }
}

resource "aws_lb_target_group" "target_group" {
  name     = "Piotrek-tf-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.instance1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = aws_instance.instance2.id
  port             = 80
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}