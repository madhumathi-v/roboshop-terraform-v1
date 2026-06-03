resource "azurerm_network_interface" "frontend" {
  name                = "frontend-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"

  ip_configuration {
    name                          = "frontend-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "frontend" {
  name                = "frontend"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  size                = "Standard D2s v3 (2 vcpus, 8 GiB memory)"
  network_interface_ids = [azurerm_network_interface.frontend.id ]
  
  source_image_id = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Compute/galleries/image_vm/images/image"

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  admin_username = "devops"
  admin_password = "Devops@123456"

 disable_password_authentication = false
 secure_boot_enabled = true

 
  
}


resource "azurerm_dns_a_record" "frontend" {
  name                = "frontend-dev"
  zone_name           = "yogidevops.online"
  resource_group_name = "Denmark_East"
  ttl                 = 30
  records             = [azurerm_network_interface.frontend.id ]
}