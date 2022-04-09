variable "region" {
  description = "Programmatic value of the AWS region for deployment."
  type        = string
}

variable "env" {
  description = "Environment prefix for all resources."
  type        = string
}

variable "bucket_names" {
  description = "S3 bucket Name."
  type        = list(string)
}

variable "bucket_versioning" {
  description = "Flag to set bucket versioning status."
  type        = list(bool)
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
  description = "Number of Days for Storage Class Glacier."
  type        = list(number)
}

variable "kms_deletion_window_in_days" {
  description = "KMS Deletion Window in Days."
  type        = number
}

variable "enable_kms_key_rotation" {
  description = "Specifies whether key rotation is enabled."
  type        = bool
}
