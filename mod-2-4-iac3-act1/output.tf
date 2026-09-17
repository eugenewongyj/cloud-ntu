output "private_subnet_ids" {
    description = "List of IDs of private subnets"
    value = module.vpc.private_subnets
}

output "nat_gateway_ids" {
 value = module.vpc.natgw_ids
}
