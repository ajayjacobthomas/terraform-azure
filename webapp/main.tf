resource "azurerm_resource_group" "dev" {
  name     = "TERRAFORM-TESTS"
  location = "North Europe"
}

resource "azurerm_app_service_plan" "dev" {
  name                = "_appserviceplan_"
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "dev" {
  name                = "__appservicename__"
  location            = azurerm_resource_group.dev.location
  resource_group_name = azurerm_resource_group.dev.name
  app_service_plan_id = azurerm_app_service_plan.dev.id
}