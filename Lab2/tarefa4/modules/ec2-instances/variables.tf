variable "instance_count" {
    description = "Numero de instancias EC2 a serem criadas"
    type = number
}

variable "ami" {
    description = "A Amazon Machine Image (AMI) a ser usada pela instancia"
    type = string
}

variable "instance_type" {
    description = "O tipo de instancia a ser criada"
    type = string
}

variable "subnet_id" {
    description = "ID da subnet para as instancias EC2"
    type = string
}
