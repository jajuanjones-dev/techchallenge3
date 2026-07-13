resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "techchallenge3-bucket-${random_id.bucket_suffix.hex}"

  tags = {
    Name = "techchallenge3-bucket"
  }
}
