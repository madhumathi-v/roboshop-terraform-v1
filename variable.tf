variable "location" {
  default = "Denmark East"
}

variable "resource_group_name" {
  default = "Denmark_East"
}

variable "image_id"{
    default = "/subscriptions/3c3ac820-a526-4fd5-841f-cbb2d7ffa483/resourceGroups/Denmark_East/providers/Microsoft.Compute/galleries/image_vm/images/image"
}

variable "components" {
  default = {
    frontend = "Standard_D2s_v3"
    catalogue = "Standard_D2s_v3"
    cart = "Standard_D2s_v3"
    user = "Standard_D2s_v3"
    shipping = "Standard_D2s_v3"
    payment = "Standard_D2s_v3"
    rabbitmq = "Standard_D2s_v3"
    mysql = "Standard_D2s_v3"
    mongodb = "Standard_D2s_v3"
    valkey = "Standard_D2s_v3"
    notification = "Standard_D2s_v3"
    orders = "Standard_D2s_v3"
    rating = "Standard_D2s_v3"

  }
}