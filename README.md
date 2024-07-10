# Terraform Module for S3 and DynamoDB for Terraform State Locking

This module creates an S3 bucket and a DynamoDB table, which can be used to store Terraform state files and lock state files to prevent concurrent modifications.

## Usage

To use this module, include it in your Terraform configuration like this:

```hcl
module "tf_state_backend" {
  source = "github.com/infraspecdev/terraform-aws-s3-dynamodb-backend?ref=main"

  s3_bucket_name          = "unique-s3-bucket-name"
  dynamodb_table_name     = "unique_dynamodb_table"
  dynamodb_read_capacity  = 21
  dynamodb_write_capacity = 21
  dynamodb_table_tags = {
    Environment = "dev"
    Project     = "backend"
  }
  s3_bucket_tags = {
    Environment = "dev"
    Project     = "backend"
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.65.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_dynamodb_tf_state_lock"></a> [dynamodb\_tf\_state\_lock](#module\_dynamodb\_tf\_state\_lock) | ./modules/dynamodb_table | n/a |
| <a name="module_tf_state_s3_bucket"></a> [tf\_state\_s3\_bucket](#module\_tf\_state\_s3\_bucket) | ./modules/s3 | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dynamodb_read_capacity"></a> [dynamodb\_read\_capacity](#input\_dynamodb\_read\_capacity) | (Optional) Number of read units for this table. | `number` | `20` | no |
| <a name="input_dynamodb_table_name"></a> [dynamodb\_table\_name](#input\_dynamodb\_table\_name) | (Required) Unique Table name within a region name of the table | `string` | n/a | yes |
| <a name="input_dynamodb_table_tags"></a> [dynamodb\_table\_tags](#input\_dynamodb\_table\_tags) | (Optional) A map of tags to populate on the created table. | `map(string)` | `{}` | no |
| <a name="input_dynamodb_write_capacity"></a> [dynamodb\_write\_capacity](#input\_dynamodb\_write\_capacity) | (Optional) Number of write units for this table. | `number` | `20` | no |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | Name of the bucket. If omitted, Terraform will assign a random, unique name. | `string` | n/a | yes |
| <a name="input_s3_bucket_tags"></a> [s3\_bucket\_tags](#input\_s3\_bucket\_tags) | (Optional) Map of tags to assign to the bucket. | `map(string)` | `{}` | no |

## Outputs

No outputs.
