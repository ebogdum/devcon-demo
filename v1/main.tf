###### PROVIDER ######

provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-state-20221109"
    key = "v1/tfstate"
    region  = "eu-west-1"
    dynamodb_table = "terraform-state-20221109"
  }
}


###### VARIABLES ######

variable "bucket_name" {
  type = string
  default = "very-proud-devops-bucket"
}

variable "acl" {
    type = string
    default = "public-read"
}

variable "identifiers" {
  type = list
  default = ["*"]
}

variable "actions" {
    type = list
    default = ["s3:GetObject", "s3:ListBucket"]
}

variable "versioning" {
  type = string
  default = "Disabled"
}

variable "index_document" {
  type = string
  default = "index.html"
}

variable "error_document" {
  type = string 
  default = "error.html"
}


###### RESOURCES ######

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "very-proud-devops-bucket"
}
resource "aws_s3_bucket_acl" "s3_bucket_acl" {
  bucket = aws_s3_bucket.s3_bucket.id
  acl    = var.acl
}
data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = var.identifiers
    }

    actions =var.actions

    resources = [
      aws_s3_bucket.s3_bucket.arn,
    ]
  }
}
resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}
resource "aws_s3_bucket_versioning" "s3_bucket_versioning" {
  bucket = aws_s3_bucket.s3_bucket.id

  versioning_configuration {
    status = var.versioning
  }
  
}
resource "aws_s3_bucket_website_configuration" "s3_bucket_website_configuration" {
  bucket = aws_s3_bucket.s3_bucket.id

  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}