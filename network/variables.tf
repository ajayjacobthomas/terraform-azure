variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "EU_RG"
}

variable "location" {
  description = "The Azure region where resources will be created"
  type        = string
  default     = "westeurope"
}

variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "EU-VNet"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.20.0.0/16"]
}

variable "subnet1_name" {
  description = "The name of subnet 1"
  type        = string
  default     = "EU-Linux-Subnet"
}

variable "subnet1_prefix" {
  description = "The address prefix for subnet 1"
  type        = list(string)
  default     = ["10.20.1.0/24"]
}

variable "subnet2_name" {
  description = "The name of subnet 2"
  type        = string
  default     = "EU_Windoss-Subnet"
}

variable "subnet2_prefix" {
  description = "The address prefix for subnet 2"
  type        = list(string)
  default     = ["10.30.2.0/24"]
}
