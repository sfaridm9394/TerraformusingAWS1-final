######################################################
# VPC OUTPUTS
######################################################

output "vpc_id" {
  description = "The VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_1_id" {
  description = "Public Subnet 1 ID"
  value       = module.vpc.public_subnet_1_id
}

output "public_subnet_2_id" {
  description = "Public Subnet 2 ID"
  value       = module.vpc.public_subnet_2_id
}

output "private_subnet_1_id" {
  description = "Private Subnet 1 ID"
  value       = module.vpc.private_subnet_1_id
}

output "private_subnet_2_id" {
  description = "Private Subnet 2 ID"
  value       = module.vpc.private_subnet_2_id
}


######################################################
# SECURITY GROUP OUTPUTS
######################################################

output "sg_id" {
  description = "Security Group ID"
  value       = module.sg.sg_id
}


######################################################
# EC2 OUTPUTS (IF YOUR EC2 MODULE EXPORTS THESE)
######################################################

output "instance1_id" {
  description = "EC2 instance 1 ID"
  value       = module.ec2.instance1_id
}

output "instance2_id" {
  description = "EC2 instance 2 ID"
  value       = module.ec2.instance2_id
}


######################################################
# ALB OUTPUTS
######################################################

output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = module.alb.alb_dns_name
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = module.alb.target_group_arn
}


######################################################
# AUTOSCALING OUTPUTS
######################################################

output "autoscaling_group_name" {
  description = "Autoscaling Group Name"
  value       = module.autoscaling.asg_name
}

output "launch_template_id" {
  description = "Launch Template ID"
  value       = module.autoscaling.launch_template_id
}


######################################################
# DYNAMODB OUTPUTS
######################################################

output "metadata_table_name" {
  description = "Metadata DynamoDB Table Name"
  value       = module.dynamodb.metadata_table_name
}

output "state_lock_table_name" {
  description = "Terraform Lock Table Name"
  value       = module.dynamodb.state_lock_table_name
}

output "bucket_name" {
  value = module.lambda_s3_dynamo.bucket_name
}

output "dynamodb_table" {
  value = module.lambda_s3_dynamo.dynamodb_table
}

output "lambda_name" {
  value = module.lambda_s3_dynamo.lambda_name
}

