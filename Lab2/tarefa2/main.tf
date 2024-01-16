variable "instance_type"{
    description = "O tipo de instancia a ser criada"
}

variable "ami" {
    description = "A Amazon Machine Image (AMI) a ser usada pela instancia"
}

variable "region" {
    description = "A regiao da AWS que a instancia sera criada"
    default = "us-east-2"
}

provider "aws" {
    region = var.region
}

resource "aws_instance" "example" {
    ami = var.ami
    instance_type = var.instance_type

    tags = {
        Name = "tarefa1-terraform"
    }
}