resource "aws_s3_bucket_website_configuration" "s3_bucket_website_configuration" {
  bucket = var.bucket

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }

  routing_rules = var.routing_rules

}