module "s3_bucket_siteC" {
    source = "../../resources/aws/modules/s3_html_bucket"
    
    environment = "qa"
    name = "very-proud-devops-bucket-siteC"
    acl = "public-read"
}