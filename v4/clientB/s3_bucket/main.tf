module "s3" {
  source = "../../s3"
  
  bucket = "very-proud-devops-bucket"
}

module "s3_acl" {
  source = "../../s3_bucket_acl"

  bucket = module.s3.id
  acl = var.acl
}

module "s3_policy_getData" {
  source = "../../iam_policy_document"

  identifiers = ["*"]
  actions = ["s3:GetObject", "s3:ListBucket"]
  resources = [module.s3.arn]
}

module "s3_policy" {
  source = "../../s3_bucket_policy"

  bucket = module.s3.id
  policy = module.s3_policy_getData.json
}