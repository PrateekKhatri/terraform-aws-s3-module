resource "random_string" "random" {
  length  = 8
  special = false
}

resource "aws_s3_bucket" "weather_report_buckets" {
  count         = length(var.bucket_names)
  bucket        = "${var.env}-${lower(random_string.random.id)}-${element(var.bucket_names, count.index)}"
  force_destroy = true
  acl           = "private"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.s3_encryption_key
        sse_algorithm     = "aws:kms"
      }
    }
  }
  versioning {
    enabled = element(var.bucket_versioning, count.index)
  }
  lifecycle {
    prevent_destroy = false
  }

  acceleration_status = "Enabled"

  lifecycle_rule {
    id      = "log"
    prefix  = "logs/"
    enabled = true

    transition {
      days          = element(var.storage_class_standarad_ia_days, count.index)
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = element(var.storage_class_galcier_days, count.index)
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }

  tags = {
    Name        = "${var.env}-${lower(random_string.random.id)}-${element(var.bucket_names, count.index)}"
    Environment = "${var.env}"
  }

}

resource "aws_s3_bucket_public_access_block" "weather_report_buckets_block_public_access" {
  count  = length(var.bucket_names)
  bucket = aws_s3_bucket.weather_report_buckets[count.index].id

  # Block new public ACLs and uploading public objects
  block_public_acls = element(var.block_public_acls, count.index)

  # Retroactively remove public access granted through public ACLs
  ignore_public_acls = element(var.ignore_public_acls, count.index)

  # Block new public bucket policies
  block_public_policy = element(var.block_public_policy, count.index)

  # Retroactivley block public and cross-account access if bucket has public policies
  restrict_public_buckets = element(var.restrict_public_buckets, count.index)
}
