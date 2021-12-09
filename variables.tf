variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources (inclusive)"
  type        = map(string)
}

variable "account_kind" {
  description = "Account tier of the storage account that will be created."
  type        = string
  default     = "StorageV2"
}

variable "account_tier" {
  description = "Account tier of the storage account that will be created."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "replication type of the storage account that will be created."
  type        = string
  default     = "LRS"
}

variable "buckets" {
  description = "Bucket that will be created."
  type = map(object({
    container_access_type = string
  }))
  default = {}
}
