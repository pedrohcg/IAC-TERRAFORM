module "security_group" {
    source = "./modules/security-group"
    name = var.name
    ingress_from_port = var.ingress_from_port
    ingress_to_port = var.ingress_to_port
    egress_from_port = var.egress_from_port
    egress_to_port = var.egress_to_port
}


module "ec2-instances" {
    source = "./modules/ec2-instances"
    for_each = toset(var.vm_names)
    vm_name = each.value
    ami = var.ami
    instance_type = var.instance_type
    security_group_id = [module.security_group.sg_id]
    key_name = var.key_name
}
