variable "bucket_name" {
  type = string
}

variable "acl" {
    type = string
}

variable "identifiers" {
  type = list
}

variable "actions" {
    type = list
}

variable "versioning" {
  type = string
}

variable "index_document" {
  type = string
}

variable "error_document" {
  type = string 
}
