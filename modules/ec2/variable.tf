
variable "ami" {}
variable "instance_type" {}
variable "public_subnet1" {
  type = string
}

variable "public_subnet2" {
  type = string
}

variable "private_subnet1" {
  type = string
}

variable "private_subnet2" {
  type = string
}

variable "sg_id" {
  type = list(string)  # because you're passing a list: [module.sg.sg_id]
}

variable "userdata_file" {}

