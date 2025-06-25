variable "environment" {
  type        = string
  description = "the env type"
  default     = "staging"

}

variable "allowed_locations" {
  type        = list(string)
  description = "list of allowed locations"
  default     = ["West Europe", "North Europe", "East US"]

}

variable "location" {
  default = "West Europe"
  type    = string

}

variable "resource_tags" {
  type        = map(string)
  description = "tags to apply to the resources"
  default = {
    "environment" = "staging"
    "managed_by"  = "terraform"
    "department"  = "devops"
  }

}

variable "storage_account_name" {
  type    = set(string)
  default = ["goziestorage1", "goziestorage2"]
}
