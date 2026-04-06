module "sg" {
  source = "./modules/SG"

  vpc_id      = module.vpc.vpc_id
  SGname      = var.SGname
  cidr_blocks = ["0.0.0.0/0"]
}

module "ec2" {
  source = "./modules/ec2"

  ami           = var.ami
  instance_type = lookup(var.instance_type_map, terraform.workspace, "t2.micro")
  sg_id         = [module.sg.sg_id]
  public_subnet1  = module.vpc.public_subnet_1_id
  public_subnet2  = module.vpc.public_subnet_2_id
  private_subnet1 = module.vpc.private_subnet_1_id
  private_subnet2 = module.vpc.private_subnet_2_id
  userdata_file = "userdata/userdata.sh"
}



module "vpc" {
  source = "./modules/vpc"

  # PUBLIC SUBNET CIDRs
  cidr_block1 = var.cidr_block1
  cidr_block2 = var.cidr_block2

  # PRIVATE SUBNET CIDRs
  cidr_block4 = var.cidr_block4
  cidr_block5 = var.cidr_block5

  # Public route default route CIDR (usually 0.0.0.0/0)
  cidr_block3 = var.cidr_block3

  # Private route default CIDRs (usually 0.0.0.0/0)
  cidr_block6 = var.cidr_block6
  cidr_block7 = var.cidr_block7
}


module "alb" {
  source = "./modules/ALB"

  alb_name          = "myalb"
  target_group_name = "mytg"

  security_group_id = module.sg.sg_id

  subnet1_id = module.vpc.public_subnet_1_id
  subnet2_id = module.vpc.public_subnet_2_id

  vpc_id = module.vpc.vpc_id

  instance1_id = module.ec2.instance1_id
  instance2_id = module.ec2.instance2_id
}



module "autoscaling" {
  source = "./modules/AutoScaling"

  desired_capacity = var.desired_capacity
  max_size         = var.max_size
  min_size         = var.min_size

  subnet_ids = [
    module.vpc.public_subnet_1_id,
    module.vpc.public_subnet_2_id
  ]

  ami_id         = var.ami_id
  instance_type = var.instance_type_map[terraform.workspace]
  sg_id          = [module.sg.sg_id]

  target_group_arn = module.alb.target_group_arn
}


module "dynamodb" {
  source = "./modules/dynamodb"

  table_name  = var.table_name
  environment = var.environment
}


module "s3" {
  source = "./modules/S3"
  aws_s3_bucket       = var.s3_bucket_name
}


module "lambda_s3_dynamo" {
  source = "./modules/lambda_s3_dynamo"

  name                = var.project_name
  s3_bucket_name      = var.s3_bucket_name
  dynamodb_table_name = var.dynamodb_table_name
  lambda_zip_path     = var.lambda_zip_path
}

  