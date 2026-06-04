

resource "azurerm_public_ip" "frontend" {
  name                = "frontend"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  allocation_method   = "Static"

  tags = {
    environment = "Production"
  }
}
resource "azurerm_network_interface" "frontend" {
  name                = "frontend-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"
  
  ip_configuration {
    name                          = "frontend-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.frontend.id
  }
}
resource "azurerm_linux_virtual_machine" "frontend" {
  name                = "frontend"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
    size                = "Standard_D2s_v3"
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
  target_resource_id = azurerm_public_ip.frontend.id


}

# Catalogue
resource "azurerm_network_interface" "catalogue" {
  name                = "catalogue-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"
  
  ip_configuration {
    name                          = "catalogue-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "catalogue" {
  name                = "catalogue"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.catalogue.id ]
  
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


# MySQL Server

resource "azurerm_network_interface" "mysql" {
  name                = "mysql-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"
  
  ip_configuration {
    name                          = "mysql-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "mysql" {
  name                = "mysql"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.mysql.id ]
  
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



# Cart
resource "azurerm_network_interface" "cart" {
  name                = "cart-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"
  
  ip_configuration {
    name                          = "cart-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "cart" {
  name                = "cart"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.cart.id ]
  
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


# Shipping
resource "azurerm_network_interface" "shipping" {
  name                = "shipping-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"
  
  ip_configuration {
    name                          = "shipping-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}
# shipping VM
resource "azurerm_linux_virtual_machine" "shipping" {
  name                = "shipping"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.shipping.id ]
  
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

# mongo

resource "azurerm_network_interface" "mongodb" {
  name                = "mongodb-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"
  
  ip_configuration {
    name                          = "mongodb-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "mongodb" {
  name                = "mongodb"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.mongodb.id ]
  
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

# User

resource "azurerm_network_interface" "user" {
  name                = "user-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"
  
  ip_configuration {
    name                          = "user-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine" "user" {
  name                = "user"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.user.id ]
  
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


# Payment
resource "azurerm_network_interface" "payment" {
  name                = "payment-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"
  
  ip_configuration {
    name                          = "payment-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "payment" {
  name                = "payment"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.payment.id ]
  
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


# valkey

resource "azurerm_network_interface" "valkey" {
  name                = "valkey-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"
  
  ip_configuration {
    name                          = "valkey-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "valkey" {
  name                = "valkey"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.valkey.id ]
  
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

# orders
resource "azurerm_network_interface" "orders" {
  name                = "orders-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"
  
  ip_configuration {
    name                          = "orders-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "orders" {
  name                = "orders"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.orders.id ]
  
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


# rating 
resource "azurerm_network_interface" "rating" {
  name                = "rating-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"
  
  ip_configuration {
    name                          = "rating-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "rating" {
  name                = "rating"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.rating.id ]
  
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

# Notification

resource "azurerm_network_interface" "notification" {
  name                = "notification-nic"
  location            = "Denmark East"
  resource_group_name = "Denmark_East"
  
  ip_configuration {
    name                          = "notification-nic"
    subnet_id                     = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Network/virtualNetworks/image-vm-vnet/subnets/default"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "notification" {
  name                = "notification"
  resource_group_name = "Denmark_East"
  location            = "Denmark East"
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.notification.id ]
  
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