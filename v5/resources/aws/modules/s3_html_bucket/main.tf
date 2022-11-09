module "s3" {
  source = "../../sub-modules/s3_bucket"

  name = "bucket"
  acl = "public-read"
}

module "s3_html" {
  source = "../../resources/s3_bucket_website_configuration_wo_routing"

  bucket = module.s3.id
  index_document = var.index_document
  error_document = var.error_document
}
