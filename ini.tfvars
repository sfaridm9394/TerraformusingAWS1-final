variable "ami" {
  default = "ami-02dfbd4ff395f2a1b"
}
variable "instance_type" {
  default = "t3.micro"
}
variable "public_subnet1" {
  default = "aws_subnet.sub1.id"
}
variable "public_subnet2" {
  default = "aws_subnet.sub2.id"
}
variable "private_subnet1" {
  default = "aws_subnet.privatesub1.id"
}
variable "private_subnet2" {
  default = "aws_subnet.privatesub2.id"
}

variable "vpc_id" {
  default = "aws_vpc.myvpc.id"
}

variable "SGname" {
  default = "my-open-sg"

}

variable "cidr_block" {
  default = "10.0.0.0/16"

}

variable "cidr_block1" {
  default = "10.0.1.0/24"

}

variable "cidr_block2" {
  default = "10.0.2.0/24"

}

variable "cidr_block3" {
  default = "0.0.0.0/0"

}

variable "cidr_block4" {
  default = "10.0.3.0/24"
}

variable "cidr_block5" {
  default = "10.0.4.0/24"
}

variable "cidr_block6" {
  default = "0.0.0.0/0"
}

variable "cidr_block7" {
  default = "0.0.0.0/0"
}


variable "desired_capacity" {
  type    = number
  default = 2
}

variable "max_size" {
  type    = number
  default = 2
}

variable "min_size" {
  type    = number
  default = 1
}

variable "ami_id" {
  default = "ami-0f9fc25dd2506cf6d"
}

variable "instance_type1" {
  default = "t3.micro"
}

variable "alb_name" {
  default = "my-alb"
  
}
variable "target_group_name" {
  default = "my-target-group"
  
}
variable "instance2_id" {
  default = "Myins2"
}

variable "instance1_id" {
  default = "Myins1"
}

variable "table_name" {
  default = "my-dynamodb-table"
}
variable "environment" {
  default = "int"
}


variable "s3_bucket_name" {
  description = "Name of the S3 bucket to create"
  type        = string
  default = "my-yamaha-test-bucket"
}

variable "dynamodb_table" {
  default = "my-dynamodb-table"
}

variable "dynamodb_arn" { 
  default = "arn:aws:dynamodb:us-east-1:123456789012:table/my-dynamodb-table" 

}
