output "alb_dns_name" {
  value = aws_lb.myALB.dns_name
}
output "mytarget_group_arn" { 
  value = aws_lb_target_group.myTG.arn 
  
}