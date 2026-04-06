resource "aws_instance" "webserver1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.sg_id
  subnet_id              = var.public_subnet1
  user_data_base64       = base64encode(file("userdata.sh"))


}

resource "aws_instance" "webserver2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.sg_id
  subnet_id              = var.public_subnet2
  user_data_base64       = base64encode(file("userdata1.sh"))


}

resource "aws_instance" "DB1" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.sg_id
  subnet_id              = var.private_subnet1


}

resource "aws_instance" "DB2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = var.sg_id
  subnet_id              = var.private_subnet2


}
