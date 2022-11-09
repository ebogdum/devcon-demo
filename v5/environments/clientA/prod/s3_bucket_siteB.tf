module "s3_bucket_siteB" {
    source = "../../resources/aws/modules/s3_html_bucket"
    
    environment = "prod"
    name = "very-proud-devops-bucket-siteB"
    acl = "public-read"
}