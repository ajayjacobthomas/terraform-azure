variable "subscription_id" {
  description = "The Subscription ID where resources will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the storage account."
  type        = string
  default     = "TERRAFORM-TESTS"
}

variable "storage_account_name" {
  description = "Specifies the name of the storage account."
  type        = string
  default     = "ajgcpstoacct"
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  type        = string
  default     = "North Europe"
}

variable "account_tier" {
  description = "Defines the Tier to use for this storage account."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "The type of replication to use for this storage account."
  type        = string
  default     = "LRS"
}

variable "minimum_tls_version" {
  description = "The minimum TLS version to be permitted on requests to storage."
  type        = string
  default     = "TLS1_2"
}

variable "soft_delete_retention_days" {
  description = "The number of days to retain deleted blobs, files, and containers."
  type        = number
  default     = 7
}
