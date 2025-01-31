provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "devopskurs-wania-rg"
  location = "West Europe"
}

resource "azurerm_service_plan" "example" {
  name                = "devopskurs-wania-sp"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  os_type             = "Linux"
  sku_name            = "P1v2"
}

resource "azurerm_linux_web_app" "example" {
  name                = "devopskurs-Wania-webapp"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_service_plan.example.location
  service_plan_id     = azurerm_service_plan.example.id

  site_config {
    app_command_line = "node server.js"

    application_stack {
        node_version = "18-lts"
    }
  }
}