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
