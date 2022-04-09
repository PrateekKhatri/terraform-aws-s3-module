# #AWS Region to deploy resources
region = "us-west-2"

# #Name to be used on all the resources as identifier
env = "crazy-berlin-weather"

#Bucket Names
bucket_names = ["hourly", "daily", "weekly"]

bucket_versioning = [false, true, true]

block_public_acls = [false, false, false]

ignore_public_acls = [false, false, false]

block_public_policy = [false, false, false]

restrict_public_buckets = [false, false, false]

storage_class_standarad_ia_days = [40, 40, 40]

storage_class_galcier_days = [70, 70, 70]

kms_deletion_window_in_days = 7

enable_kms_key_rotation = true
