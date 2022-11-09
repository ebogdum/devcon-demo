variable "identifiers" {
  type = list
  description = "(Required) List of identifiers for principals. When type is AWS, these are IAM principal ARNs, e.g., arn:aws:iam::12345678901:role/yak-role. When type is Service, these are AWS Service roles, e.g., lambda.amazonaws.com. When type is Federated, these are web identity users or SAML provider ARNs, e.g., accounts.google.com or arn:aws:iam::12345678901:saml-provider/yak-saml-provider. When type is CanonicalUser, these are canonical user IDs, e.g., 79a59df900b949e55d96a1e698fbacedfd6e09d98eacf8f8d5218e7cd47ef2be"
  default = ["*"]
}

variable "actions" {
    type = list
    description = "(Optional) - List of actions that this statement either allows or denies. For example, [\"ec2:RunInstances\", \"s3:*\"]."
}

variable "resources" {
    type = list
    description = "(Optional) - List of resource ARNs that this statement applies to. This is required by AWS if used for an IAM policy. Conflicts with not_resources."  
}