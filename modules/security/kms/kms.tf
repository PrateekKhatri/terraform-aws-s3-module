data "aws_caller_identity" "current" {}


resource "aws_kms_key" "s3_encryption_key" {
  description = var.description
  is_enabled  = true
  key_usage   = var.key_usage
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Id" : "key-default-1",
    "Statement" : [
      {
        "Sid" : "Enable IAM User Permissions",
        "Effect" : "Allow",
        "Principal" : {
          "AWS" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        "Action" : "kms:*",
        "Resource" : "*"
      }
    ]
  })
  enable_key_rotation     = var.enable_key_rotation
  deletion_window_in_days = var.deletion_window_in_days
  tags = {
    Name        = "${var.env}-s3-encryption-key"
    Environment = "${var.env}"
  }
}

resource "aws_kms_alias" "s3_encryption" {
  name          = "alias/${var.env}-s3-encryption-key"
  target_key_id = aws_kms_key.s3_encryption_key.key_id
}
