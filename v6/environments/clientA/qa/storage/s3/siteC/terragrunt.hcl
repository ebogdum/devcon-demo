terraform {
  source = "git::ssh://git@github.com:ebogdum/devcon-demo.git//v6/resources/aws/modules/s3_html_bucket?ref=v0.0.0"
}

include "root" {
  path = find_in_parent_folders()
}

locals {
  env = yamldecode(file(find_in_parent_folders("env.yaml")))
  global = yamldecode(file(find_in_parent_folders("global.yaml")))
}

inputs = {
  environment = local.env.environment
  name = "very-proud-devops-bucket-siteC"
  acl = local.global.default_acl
}