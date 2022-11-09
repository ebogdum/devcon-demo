module "s3" {
  source = "../../sub-modules/s3_bucket"

  name = var.name
  acl = var.acl
}