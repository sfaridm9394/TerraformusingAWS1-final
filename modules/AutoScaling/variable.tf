
variable "desired_capacity" {
  type    = number
  default = 4
}

variable "max_size" {
  type    = number
  default = 6
}

variable "min_size" {
  type    = number
  default = 2
}

variable "ami_id" {}

variable "instance_type" {
  type = string
}

variable "sg_id" {
  type = list(string)
}

variable "subnet_ids" {
  type = list(string)
}
variable "target_group_arn" {
  type = string
}