resource "azurerm_resource_group" "main" {
  name     = "rg-quiz-ks"
  location = "North Europe"
}

resource "azurerm_linux_virtual_machine" "jenkins" {
  name                            = "vm-jenkins-ks"
  resource_group_name             = azurerm_resource_group.main.name
  location                        = azurerm_resource_group.main.location
  size                            = "Standard_DS1_v2"
  admin_username                  = "adminuser"
  admin_password                  = "Admin123!"
  disable_password_authentication = false
  network_interface_ids           = [azurerm_network_interface.jenkins.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7.5"
    version   = "latest"
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  count               = length(var.cluster_name)
  name                = var.cluster_name[count.index]
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  dns_prefix          = var.cluster_name[count.index]

  default_node_pool {
    name           = "default"
    node_count     = 1
    vm_size        = "Standard_D2_v2"
    vnet_subnet_id = azurerm_subnet.aks.id 
  }

  identity {
    type = "SystemAssigned"
  }
}