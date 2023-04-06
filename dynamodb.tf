resource "aws_dynamodb_table" "this" {
  name           = "Terraform_Lock_table"
  hash_key       = "LockID"
  billing_mode   = "PROVISIONED"
  stream_enabled = false
  read_capacity  = 1
  write_capacity = 1

  attribute {
    name = "LockID"
    type = "S"
  }


  point_in_time_recovery {
    enabled = false
  }

  server_side_encryption {
    enabled = false
  }
}
