resource "aws_autoscaling_group" "my_AS" {
  name             = "my-asg"
  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size


  vpc_zone_identifier = var.subnet_ids


  launch_template {
    id      = aws_launch_template.myLT.id
    version = "$Latest"
  }
  
target_group_arns = [var.target_group_arn]
}

output "asg_name" {
  value = aws_autoscaling_group.my_AS.name
}
