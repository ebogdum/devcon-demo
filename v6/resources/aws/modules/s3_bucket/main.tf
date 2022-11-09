module "s3" {
  source = "git::ssh://git@github.com:ebogdum/devcon-demo.git//v6/resources/aws/sub-modules/s3_bucket?ref=v0.0.1"

  name = var.name
  acl = var.acl
}