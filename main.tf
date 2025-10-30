# Configure AWS Provider
provider "aws" {
  region  = "eu-central-1"  
  profile = "admin"         #user profile name in AWS CLI configuration
}

# Create S3 Bucket
resource "aws_s3_bucket" "data_bucket" {
  bucket = "kaggle-energy-consumption-data-bucket"

  tags = {
    Name        = "kaggle-energy-consumption-data-bucket"
    Environment = "Dev"
    Project     = "Energy Consumption Analysis"
  }
}

# Enable versioning
resource "aws_s3_bucket_versioning" "bucket_versioning" {
  bucket = aws_s3_bucket.data_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.data_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Block public access
resource "aws_s3_bucket_public_access_block" "bucket_public_access_block" {
  bucket = aws_s3_bucket.data_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Upload CSV file to S3
resource "aws_s3_object" "steel_industry_data" {
  bucket = aws_s3_bucket.data_bucket.id
  key    = "Steel_industry_data.csv"  # Creates a 'raw' prefix/folder
  source = "data/Steel_industry_data.csv"  # Local path to your CSV file

  etag = filemd5("data/Steel_industry_data.csv")
}