module "s3_bucket_live" {
    source = "../../resources/aws/modules/s3_bucket"
    
    environment = "prod"
    name = "very-proud-devops-bucket"
    acl = "public-read"
}