variable "eu_resource_group" {
  description = "The name of the resource group"
  type        = string
  default     = "EU_RG"
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "westeurope"
}

variable "vnet_euwest" {
  description = "The name of the virtual network"
  type        = string
  default     = "EU-VNet"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "eu_subnet1" {
  description = "subnet 1 EU for Linux"
  type        = string
  default     = "eu-Linux-Subnet"
}

variable "eu_subnet1_prefix" {
  description = "The address prefix for EU subnet 1"
  type        = list(string)
  default     = ["10.20.1.0/24"]
}

variable "eu_subnet2" {
  description = "subnet 2 EU for Windows"
  type        = string
  default     = "eu_Windows-Subnet"
}

variable "eu_subnet2_prefix" {
  description = "The address prefix for EU subnet 2"
  type        = list(string)
  default     = ["10.30.2.0/24"]
}
