# AWS S3 bucket Terraform module

Terraform module which creates 3 S3 buckets with suffix (hourly, daily and weekly) and KMS Key on AWS by Terraform AWS provider.


These features of S3 bucket configurations are supported:

- acl
- versioning
- lifecycle rules
- server-side encryption
- block public access

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.63.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 3.63.0 |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | The ARN of the bucket. Will be of format arn:aws:s3:::bucketname. |

## Usage

Clone the repo and update the parameters in "parameters.auto.tfvars".

All the parameters must be passed in "parameters.auto.tfvars".

Parameters must be passed in systematic way, for example if you need versioning to be enabled on hourly and weekly buckets, then bucket_versioning parameter must follow pattern ( bucket_versioning = [true, false, true] ).
Same pattern must be follow for all the list parameters in parameters.auto.tfvars file.

If you want to save the state of your bucket in s3 bucket than you can add backend bucket details in backend.tf file.
