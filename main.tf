 # Create an S3 bucket
resource "aws_s3_bucket" "mybucket"{
    bucket = var.bucketname
}
 
# Configure S3 bucket ownership
resource "aws_s3_bucket_ownership_controls" "quiz-bucket"{
    bucket = aws_s3_bucket.mybucket.id
 
    rule {
      object_ownership = "BucketOwnerPreferred"
    }
}

# Configure S3 bucket public access
resource "aws_s3_bucket_public_access_block" "quiz-bucket" {
  bucket = aws_s3_bucket.mybucket.id
 
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}

# Set the S3 bucket ACL to public-read
resource "aws_s3_bucket_acl" "quiz-bucket"{
    depends_on = [
        aws_s3_bucket_ownership_controls.quiz-bucket,
        aws_s3_bucket_public_access_block.quiz-bucket,
         ]
    bucket = aws_s3_bucket.mybucket.id
    acl    = "public-read"
}

# Uploading the index.html file to the S3 bucket
resource "aws_s3_object" "index"  {
  bucket = aws_s3_bucket.mybucket.id
  key = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

# Upload the styles.css file to the S3 bucket
resource "aws_s3_object" "styles" {
  bucket = aws_s3_bucket.mybucket.id
  key = "styles.css"
  source = "styles.css"
  acl = "public-read"
  content_type = "text/css"
}

# Upload the quiz.js file to the S3 bucket
resource "aws_s3_object" "quiz" {
  bucket = aws_s3_bucket.mybucket.id
  key = "quiz.js"
  source = "quiz.js"
  acl = "public-read"
  content_type = "text/js"
}

# Configure the S3 bucket for static website hosting
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id
  index_document {
    suffix = "index.html"
  }
 
  depends_on = [ aws_s3_bucket_acl.quiz-bucket ]
 
}