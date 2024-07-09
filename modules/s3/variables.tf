variable "name" {
  description = "Name of the bucket. If omitted, Terraform will assign a random, unique name."
  type        = string
}

variable "tags" {
  description = "(Optional) Map of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}
