variable "env" {
  description = "Environment prefix for all resources."
  type        = string
}

variable "key_policy" {
  description = "A valid KMS key policy JSON document."
  type        = string
  default     = null
}

variable "description" {
  description = "The description of the key as viewed in AWS console."
  type        = string
  default     = "Managed by Terraform"
}

variable "key_usage" {
  description = "Specifies the intended use of the key."
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource, must be between 7 and 30 days."
  type        = number
  default     = 30
}

variable "enable_key_rotation" {
  description = "Specifies whether key rotation is enabled."
  type        = bool
  default     = true
}
