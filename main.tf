module "dynamodb_tf_state_lock" {
  source         = "./modules/dynamodb_table"
  name           = var.dynamodb_table_name
  read_capacity  = var.dynamodb_read_capacity
  write_capacity = var.dynamodb_write_capacity
  tags           = var.dynamodb_table_tags
}

module "tf_state_s3_bucket" {
  source = "./modules/s3"
  name   = var.s3_bucket_name
  tags   = var.s3_bucket_tags
}
