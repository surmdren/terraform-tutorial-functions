locals {
######## For loop #######

# ## List example
#   sample_network = [
#     for key, val in var.networks:[
#     # Nested for loop
#       for snet_key, snet in val.subnets:
#       merge({
#         vnetName = key,
#         vnet_address_space = val.address_space
#       }, snet)
#     ]
#   ]

## Map example
  sample_network = [
    for key, val in var.networks:{
    # Nested for loop
      for snet_key, snet in val.subnets:
      snet_key => merge({
        vnetName = key,
        vnet_address_space = val.address_space
      }, snet)
    }
  ]


## Map example 2
  node_groups_expanded = { for k, v in var.node_groups : k => merge(
    {
      a = "1"
      b = "2"
    })
  }
}


######## Output variables #######
output "print_network" {
  value = local.sample_network
}

output "node_groups_expanded" {
  value = local.node_groups_expanded
}