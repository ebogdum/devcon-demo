bucket_name = "very-proud-devops-bucket"
acl = "public-read"
identifiers = ["*"]
actions = ["s3:GetObject", "s3:ListBucket"]
versioning = "Disabled"
index_document = "index.html"
error_document = "error.html"

