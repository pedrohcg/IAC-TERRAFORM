variable "vm_name" {
    type = string
}

variable "ami" {
    description = "A Amazon Machine Image (AMI) a ser usada pela instancia"
    type = string

    validation {
        condition     = var.ami == "ami-0a0d9cf81c479446a"
        error_message = "O ami deve ser ami-0a0d9cf81c479446a"
    }
}

variable "instance_type" {
    description = "O tipo de instancia a ser criada"
    type = string
}

variable "security_group_id" {
    description = "ID do SC para as instancias EC2"
    type = list(string)
}

variable "key_name" {
    description = "Name of key pair aws"
    type = string
}