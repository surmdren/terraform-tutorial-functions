## Map varibles test.
variable "networks" {
  default = {
      "dev_net" = {
        address_space = "10.0.0.0/8"
        subnets = {
            "subnet_01" = {
                address_prefix = ["10.1.0.0/16"],
                enable_netgateway = true
            },
            "web" = {
                address_prefix = ["10.2.0.0/16"],
                enable_netgateway = true
            },
        }
      }
  }
}


variable "node_groups" {
  description = "Test"
  type        = any
  default     = {
    a = "default"
    b = "default"
  }
}

#Dynamic variables test.
