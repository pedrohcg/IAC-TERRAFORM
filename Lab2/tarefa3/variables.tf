variable "region" {
    description = "A regiao da AWS que a instancia sera criada"
    default = "us-east-2"
    type = string
}

variable "instance_type"{
    description = "O tipo de instancia a ser criada"
    type = string
    default = "t2.micro"
}

variable "vpc_ids" {
    description = "IDs das VPCs onde as instancias do EC2 serao criadas"
    type = list(string)
}

variable "subnets" {
    description = "Subnets para instancias EC2 em cada VPC"
    type = list(string)
}

variable "ami" {
    description = "A Amazon Machine Image (AMI) a ser usada pela instancia"
    type = string
}
