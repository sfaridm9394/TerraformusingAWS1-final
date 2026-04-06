output "nat_eip_1" {
  value = aws_eip.nat_eip_1
}

output "nat_eip_2" {
  value = aws_eip.nat_eip_2
}

output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "public_subnet_1_id" {
  value = aws_subnet.sub1.id
}

output "public_subnet_2_id" {
  value = aws_subnet.sub2.id
}

output "private_subnet_1_id" {
  value = aws_subnet.privatesub1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.privatesub2.id
}