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
    vpc_security_group_ids = [aws_security_group.permit_ssh.id]
    key_name = "dsa-lab3"

    tags = {
        Name = "lab3-t2-terraform"
    }

    provisioner "file" {
        source = "dsa_script.sh"
        destination = "/tmp/dsa_script.sh"

        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("dsa-lab3.pem")
            host = self.public_ip
        }
    }

    provisioner "remote-exec" {
        inline = ["chmod +x /tmp/dsa_script.sh", "/tmp/dsa_script.sh"]

        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("dsa-lab3.pem")
            host = self.public_ip
        }
    }
}