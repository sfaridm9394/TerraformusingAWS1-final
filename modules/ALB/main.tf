resource "aws_lb" "myALB" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"

  security_groups    = [var.security_group_id]
  subnets            = [var.subnet1_id, var.subnet2_id]
}

resource "aws_lb_target_group" "myTG" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/"
  }
}

resource "aws_lb_target_group_attachment" "tgattachment1" {
  target_group_arn = aws_lb_target_group.myTG.arn
  target_id        = var.instance1_id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tgattachment2" {
  target_group_arn = aws_lb_target_group.myTG.arn
  target_id        = var.instance2_id
  port             = 80
}

resource "aws_lb_listener" "myListener" {
  load_balancer_arn = aws_lb.myALB.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.myTG.arn
    type             = "forward"
  }
}

output "alb_dns_name1" {
  value = aws_lb.myALB.dns_name
}

output "alb_dns_name2" {
  value = aws_lb.myALB.dns_name
}

output "target_group_arn" {
  value = aws_lb_target_group.myTG.arn
}