output "s3_bucket_arn" {
  value = aws_s3_bucket.weather_report_buckets.*.arn
}
