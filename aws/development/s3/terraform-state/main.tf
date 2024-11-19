resource "aws_s3_bucket" "terraform_state" {
    bucket = "${var.env}-tf-state"
    force_destroy = true
}

resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.bucket
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "versioning_lifecycle_config" {
  bucket = aws_s3_bucket.terraform_state.bucket
  rule {
    id = "wasted-resources"
    expiration {
      days = 90
    }
    transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days          = 60
      storage_class = "GLACIER"
    }
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
    name            = "${var.env}-terraform-state-locking"
    billing_mode    = "PAY_PER_REQUEST"
    hash_key        = "LockID"
    attribute {
        name        = "LockID"
        type        = "S"
    }
}