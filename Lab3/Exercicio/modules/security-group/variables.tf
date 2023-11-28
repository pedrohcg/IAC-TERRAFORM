variable "name" {
    description = "Security Group name"
    type = string
}

variable "ingress_from_port" {
    description = "From Port inbound rule"
    type = number
}

variable "ingress_to_port" {
    description = "To Port inbound rule"
    type = number
}

variable "egress_from_port" {
    description = "From Port inbound rule"
    type = number
}

variable "egress_to_port" {
    description = "To Port inbound rule"
    type = number
}