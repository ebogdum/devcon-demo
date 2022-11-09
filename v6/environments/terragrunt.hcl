remote_state {
  backend = "s3"

  config = {
    encrypt                      = true
    bucket                       = "terraform-state-20221109"
    key                          = "${path_relative_to_include()}/tfstate"
    region                       = "eu-west-1"
    skip_bucket_accesslogging    = true
    dynamodb_table               = "terraform-state-20221109"
    disable_aws_client_checksums = true
    s3_bucket_tags = {
      name = "Terragrunt state storage"
    }
  }
}