variable "name" {
    description = "Security Group name"
    type = string
}

variable "ingress_from_port" {
    description = "Porta de entrada inicial do SG"
    type = number
}

variable "ingress_to_port" {
    description = "Porta de entrada final do SG"
    type = number
}

variable "egress_from_port" {
    description = "Porta de saida inicial do SG"
    type = number
}

variable "egress_to_port" {
    description = "Porta de saida final do SG"
    type = number
}

variable "ami" {
    description = "AMI do SO na AWS"
    type = string
}

variable "instance_type" {
    description = "Tipo da isntancia EC2"
    default = "t2.micro"
}

variable "key_name" {
    description = "Nome do par de chaves da AWS"
    type = string
}

variable "vm_names" {
    type = list(string)
}