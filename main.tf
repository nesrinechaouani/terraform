# Configure the Azure Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "304799ce-2258-416d-85f2-8c42149f7550"
}

# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "app-rg"
  location = "North Europe"
}

# Create an app service plan
resource "azurerm_app_service_plan" "plan" {
  name                = "app-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Free"
    size = "F1"
  }
}

# Create a web app
resource "azurerm_app_service" "app" {
  name                = "webapp-jenkins-terraform"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_resource_plan.plan.id

  site_config {
    always_on = true
    linux_fx_version = "DOCKER|nginx"
  }
}
