output "s3_encryption_key" {
  value       = aws_kms_key.s3_encryption_key.arn
  sensitive   = true
  description = "S3 encryption key arn"
}
