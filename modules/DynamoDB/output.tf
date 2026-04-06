output "metadata_table_name" {
  value = aws_dynamodb_table.metadata.name
}

output "metadata_table_arn" {
  value = aws_dynamodb_table.metadata.arn
}

output "state_lock_table_name" {
  value = aws_dynamodb_table.dynanamoDB.name
}

output "state_lock_table_arn" {
  value = aws_dynamodb_table.dynanamoDB.arn
}