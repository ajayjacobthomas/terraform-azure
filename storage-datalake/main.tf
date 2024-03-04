resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                      = var.storage_account_name
  resource_group_name       = azurerm_resource_group.rg.name
  location                  = var.location
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  enable_https_traffic_only = true
  #allow_blob_public_access  = false
  min_tls_version = var.minimum_tls_version
  network_rules {
    default_action = "Allow"
    bypass         = ["Logging", "Metrics"]
  }
  #blob_properties {
  # delete_retention_policy {
  #days = var.soft_delete_retention_days
  #}
  #}
  #container_delete_retention_policy {
  # days = var.soft_delete_retention_days
  #}
  #file_share_properties {
  # delete_retention_policy {
  #  days = var.soft_delete_retention_days
  #}
  # }
  identity {
    type = "SystemAssigned"
  }
}