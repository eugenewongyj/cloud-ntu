resource "aws_s3_bucket" "bucket1" {
    bucket = "eugene-s3-best-bucket"
    force_destroy = true
}