resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = var.bucket

  versioning_configuration {
    status = var.versioning
  }
  
}