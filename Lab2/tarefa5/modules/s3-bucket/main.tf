resource "aws_s3_bucket" "dsa_bucket_pedro" {
    bucket = var.bucket_name
    tags = var.tags
}