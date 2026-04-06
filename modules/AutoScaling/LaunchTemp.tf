resource "aws_launch_template" "myLT" {
  name_prefix   = "myLT"
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    security_groups = var.sg_id
  }
}

output "launch_template_id" {
  value = aws_launch_template.myLT.id
}
