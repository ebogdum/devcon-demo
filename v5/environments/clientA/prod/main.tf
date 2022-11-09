provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-20221109"
    key = "clientA/prod/tfstate"
    region  = "eu-west-1"
    dynamodb_table = "terraform-state-20221109"
  }
}
