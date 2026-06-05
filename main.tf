resource "azurerm_public_ip" "main" {
  name                = "frontend"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_network_interface" "main" {
  for_each = var.components
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  
  ip_configuration {
    name                          = "${each.key}-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"

  }
}
resource "azurerm_linux_virtual_machine" "main" {

  for_each = var.components

  name                = "${each.key}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = each.value
  network_interface_ids = [azurerm_network_interface.main[each.key].id ]
  
  source_image_id = var.image_id

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }


  admin_username = "devops"
  admin_password = "Devops@123456"

 disable_password_authentication = false
 secure_boot_enabled = true

 
  
}

resource "azurerm_dns_a_record" "main" {

  for_each = var.components

  name                = "${each.key}-dev"
  zone_name           = "yogidevops.online"
  resource_group_name = var.resource_group_name
  ttl                 = 30
  target_resource_id = azurerm_public_ip.main[each.key].id


}
