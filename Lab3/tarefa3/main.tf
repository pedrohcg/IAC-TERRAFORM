resource "aws_security_group" "permit_ssh" {
    name = "permit_ssh"
    description = "Security Group EC2 Instance"

    # Regra de entrada
    ingress {
        description = "Inbound Rule"
        from_port = 22
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
    instance_type = var.instance_type
    security_groups = ["permit_ssh"]
    key_name = "dsa-lab3"

    tags = {
        Name = "lab3-t2-terraform"
    }

    provisioner "remote-exec" {
        inline = [
            "sudo yum update -y",
            "sudo yum install httpd -y",
            "sudo systemctl start httpd",
            "sudo bash -c    'echo Criando o Primeiro Web Server com Terraform > /var/www/html/index.html  '"
        ]

        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("dsa-lab3.pem")
            host = self.public_ip
        }
    }
}