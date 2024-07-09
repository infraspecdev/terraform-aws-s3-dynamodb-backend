# Attribute validations for s3 sub module
run "s3_bucket_name_match" {
  command = plan

  variables {
    name = "unique-s3-bucket-name"
    tags = {}

    expected_s3_bucket_name = "unique-s3-bucket-name"
  }

  module {
    source = "./modules/s3"
  }

  assert {
    condition     = aws_s3_bucket.this.bucket == var.expected_s3_bucket_name
    error_message = "Bucket name mismatch after creation"
  }
}

run "s3_bucket_tags_match" {
  command = plan

  variables {
    name = "unique-s3-bucket-name"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
  }

  module {
    source = "./modules/s3"
  }

  assert {
    condition     = aws_s3_bucket.this.tags["some_key_name"] == "some_value"
    error_message = "Tag 'some_key_name' with value 'some_value' is missing or incorrect"
  }

  assert {
    condition     = aws_s3_bucket.this.tags["another_key_name"] == "another_value"
    error_message = "Tag 'another_key_name' with value 'another_value' is missing or incorrect"
  }
}

# Attribute validations for dynamodb sub module
run "dynamodb_table_name_match" {
  command = plan

  variables {
    name = "dynamodb-table-name"

    expected_table_name = "dynamodb-table-name"
  }

  module {
    source = "./modules/dynamodb_table"
  }

  assert {
    condition     = aws_dynamodb_table.this.name == var.expected_table_name
    error_message = "Table name mismatch after creation"
  }
}

run "dynamodb_table_write_capacity_match" {
  command = plan

  variables {
    name           = "dynamodb-table-name"
    write_capacity = 21

    expected_write_capacity = 21
  }

  module {
    source = "./modules/dynamodb_table"
  }

  assert {
    condition     = aws_dynamodb_table.this.write_capacity == var.expected_write_capacity
    error_message = "Write capacity mismatch after creation"
  }
}

run "dynamodb_table_read_capacity_match" {
  command = plan

  variables {
    name          = "dynamodb-table-name"
    read_capacity = 21

    expected_read_capacity = 21
  }

  module {
    source = "./modules/dynamodb_table"
  }

  assert {
    condition     = aws_dynamodb_table.this.read_capacity == var.expected_read_capacity
    error_message = "Write capacity mismatch after creation"
  }
}

run "dynamodb_table_tags_match" {
  command = plan

  variables {
    name = "dynamodb-table-name"
    tags = {
      "some_key_name"    = "some_value"
      "another_key_name" = "another_value"
    }
  }

  module {
    source = "./modules/dynamodb_table"
  }

  assert {
    condition     = aws_dynamodb_table.this.tags["some_key_name"] == "some_value"
    error_message = "Tag 'some_key_name' with value 'some_value' is missing or incorrect"
  }

  assert {
    condition     = aws_dynamodb_table.this.tags["another_key_name"] == "another_value"
    error_message = "Tag 'another_key_name' with value 'another_value' is missing or incorrect"
  }
}
