module "s3_bucket_siteA" {
    source = "../../resources/aws/modules/s3_html_bucket"
    
    environment = "prod"
    name = "very-proud-devops-bucket-siteA"
    acl = "public-read"
}