
variable "name" {
  description = "(Required) Unique Table name within a region name of the table"
  type        = string
}

variable "read_capacity" {
  description = "(Optional) Number of read units for this table."
  type        = number
  default     = 20
}

variable "write_capacity" {
  description = "(Optional) Number of write units for this table."
  type        = number
  default     = 20
}

variable "tags" {
  description = "(Optional) A map of tags to populate on the created table."
  type        = map(string)
  default     = {}
}

