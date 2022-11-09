module "s3" {
  source = "git::ssh://git@github.com:ebogdum/devcon-demo.git//v6/resources/aws/sub-modules/s3_bucket?ref=v0.0.0"

  name = "bucket"
  acl = "public-read"
}

module "s3_html" {
  source = "git::ssh://git@github.com:ebogdum/devcon-demo.git//v6/resources/aws/resources/s3_bucket_website_configuration_wo_routing?ref=v0.0.0"

  bucket = module.s3.id
  index_document = var.index_document
  error_document = var.error_document
}
