output "myasg_name"           { value = aws_autoscaling_group.my_AS.name }
output "mylaunch_template_id" { value = aws_launch_template.myLT.id }