variable "bucket" {
  type = string
}

variable "versioning" {
  type = string
  description = "Enabled or Disabled. Please consider this is a string not a bool value"
  default = "Disabled"
}