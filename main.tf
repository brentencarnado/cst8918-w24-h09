provider "azurerm" {
    features {}
}

resource "azurerm_resource_group" "rg"{
    name = "hybrid9"
    location = "Canada Central"
}

resource "azurerm_kubernetes_cluster" "app" {
  name                = "aksCluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "akscluster"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }
}
