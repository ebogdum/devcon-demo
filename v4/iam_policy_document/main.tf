data "aws_iam_policy_document" "iam_policy_document" {
  statement {
    principals {
      type        = "AWS"
      identifiers = var.identifiers
    }

    actions = var.actions

    resources = var.resources
  }
}
