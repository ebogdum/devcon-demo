module "s3" {
  source = "../../resources/s3"
  
  bucket = var.name
}

module "s3_acl" {
  source = "../../resources/s3_bucket_acl"

  bucket = module.s3.id
  acl = var.acl
}

module "s3_policy_getData" {
  source = "../../data/iam_policy_document"

  identifiers = ["*"]
  actions = ["s3:GetObject", "s3:ListBucket"]
  resources = [module.s3.arn]
}

module "s3_policy" {
  source = "../../resources/s3_bucket_policy"

  bucket = module.s3.id
  policy = module.s3_policy_getData.json
}