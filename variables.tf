variable "s3_bucket_name" {
  description = "Name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
}

variable "dynamodb_table_name" {
  description = "(Required) Unique Table name within a region name of the table"
  type        = string
}

variable "dynamodb_read_capacity" {
  description = "(Optional) Number of read units for this table."
  type        = number
  default     = 20
}

variable "dynamodb_write_capacity" {
  description = "(Optional) Number of write units for this table."
  type        = number
  default     = 20
}

variable "dynamodb_table_tags" {
  description = "(Optional) A map of tags to populate on the created table."
  type        = map(string)
  default     = {}
}

variable "s3_bucket_tags" {
  description = "(Optional) Map of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}
