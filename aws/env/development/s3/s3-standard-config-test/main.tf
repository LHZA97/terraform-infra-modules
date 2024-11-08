module "s3-standard-config-test" {
  source = "github.com/LHZA97/terraform-aws-s3?ref=development"

  bucket_name = "test-bucket-for-terraform-module"
#   versioning_enabled = true
#   acceleration_enabled = false
    
   lifecycle_rules = [
    {
      id      = "example-rule"
      enabled = true
      expiration = {days = 90}
      noncurrent_version_transitions = [
        {
          days           = 30
          storage_class = "STANDARD_IA"
        }
      ]
      noncurrent_version_expiration = {
        days = 60
      }

      abort_incomplete_multipart_upload = {
        days_after_initiation = 7
      }
    }
  ]

}

