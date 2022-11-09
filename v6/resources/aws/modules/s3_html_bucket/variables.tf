variable "name" {
  type = string
}

variable "acl" {
  type = string
  default = "private"
}

variable "index_document" {
  type = string
  default = "index.html"
}

variable "error_document" {
  type = string 
  default = "error.html"
}
