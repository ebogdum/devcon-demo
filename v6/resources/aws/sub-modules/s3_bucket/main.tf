module "s3" {
  source = "git::git@github.com:ebogdum/devcon-demo.git//v6/resources/aws/resources/s3?ref=v0.0.3"
  
  bucket = var.name
}

module "s3_acl" {
  source = "git::git@github.com:ebogdum/devcon-demo.git//v6/resources/aws/resources/s3_bucket_acl?ref=v0.0.3"

  bucket = module.s3.id
  acl = var.acl
}

module "s3_policy_getData" {
  source = "git::git@github.com:ebogdum/devcon-demo.git//v6/resources/aws/data/iam_policy_document?ref=v0.0.3"

  identifiers = ["*"]
  actions = ["s3:GetObject", "s3:ListBucket"]
  resources = [module.s3.arn]
}

module "s3_policy" {
  source = "git::git@github.com:ebogdum/devcon-demo.git//v6/resources/aws/resources/s3_bucket_policy?ref=v0.0.3"

  bucket = module.s3.id
  policy = module.s3_policy_getData.json
}