
resource "aws_dynamodb_table" "this" {
  name           = var.name
  hash_key       = "LockID"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.tags
}
