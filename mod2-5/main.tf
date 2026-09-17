resource "aws_dynamodb_table" "eugene-bookinventory-terraform" {
  name         = "eugene-bookinventory-terraform"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "ISBN"
  range_key    = "Genre"

  # Only declare attributes used as keys (hash, range, or index keys)
  attribute {
    name = "ISBN"
    type = "S" # S = String, N = Number, B = Binary
  }

  attribute {
    name = "Genre"
    type = "S"
  }

  point_in_time_recovery {
    enabled = true
  }

  server_side_encryption {
    enabled = true # Defaults to AWS-managed KMS key
  }

  tags = {
    Environment = "dev"
    ManagedBy   = "terraform"
  }
}