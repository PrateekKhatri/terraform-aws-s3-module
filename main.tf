# Storage

# S3
module "s3" {
  source                          = "./modules/storage/s3"
  env                             = var.env
  s3_encryption_key               = module.kms.s3_encryption_key
  region                          = var.region
  bucket_names                    = var.bucket_names
  bucket_versioning               = var.bucket_versioning
  block_public_acls               = var.block_public_acls
  ignore_public_acls              = var.ignore_public_acls
  block_public_policy             = var.block_public_policy
  restrict_public_buckets         = var.restrict_public_buckets
  storage_class_standarad_ia_days = var.storage_class_standarad_ia_days
  storage_class_galcier_days      = var.storage_class_galcier_days
  depends_on = [
    module.kms
  ]
}

# KMS Keys
module "kms" {
  source                  = "./modules/security/kms"
  env                     = var.env
  deletion_window_in_days = var.kms_deletion_window_in_days
  enable_key_rotation     = var.enable_kms_key_rotation
}
