variable "env" {
  description = "Environment prefix for all resources."
  type        = string
}

variable "s3_encryption_key" {
  description = "S3 bucket encryption key."
  type        = string
}

variable "bucket_versioning" {
  description = "Flag to set bucket versioning status."
  type        = list(bool)
}

variable "region" {
  description = "Programmatic value of the AWS region for deployment."
  type        = string
}

variable "bucket_names" {
  description = "S3 bucket Name."
  type        = list(string)
}

variable "block_public_acls" {
  description = "Must be true if you need to Block Public ACLs."
  type        = list(string)
}

variable "ignore_public_acls" {
  description = "Must be true if you need to Block Public ACLs."
  type        = list(string)
}

variable "block_public_policy" {
  description = "Must be true if you need to Block Public ACLs."
  type        = list(string)
}

variable "restrict_public_buckets" {
  description = "Must be true if you need to Block Public ACLs."
  type        = list(string)
}

variable "storage_class_standarad_ia_days" {
  description = "Number of Days for Storage Class Standard IA."
  type        = list(number)
}

variable "storage_class_galcier_days" {
  description = "Number of Days for Storage Class Standard IA."
  type        = list(number)
}
