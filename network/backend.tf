terraform {
  backend "azurerm" {
    resource_group_name  = "TERRAFORM-TESTS"
    storage_account_name = "ajgcpstoacct"
    container_name       = "terraform"
    key                  = "net.terraform.tfstate"
  }
}