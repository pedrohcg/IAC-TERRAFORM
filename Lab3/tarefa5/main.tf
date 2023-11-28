provider "aws" {
    region = "us-east-2"
}

resource "aws_security_group" "permit_ssh" {
    name = "permit_ssh"
    description = "Security Group EC2 Instance"

    # Regra de entrada
    ingress {
        description = "Inbound Rule"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Regra de saída
    egress {
        description = "Outbound Rule"
        from_port = 0
        to_port = 65535
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "dsa_instance" {
    ami = "ami-0a0d9cf81c479446a"
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.permit_ssh.id]
    key_name = "dsa-lab3"

    user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y
                sudo yum install httpd -y
                sudo systemctl start httpd
                sudo bash -c    'echo Criando o Primeiro Web Server com Terraform > /var/www/html/index.html'
                EOF 

    tags = {
        Name = "lab3-t2-terraform"
    }
}