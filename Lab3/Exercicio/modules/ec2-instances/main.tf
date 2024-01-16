resource "aws_instance" "dsa_instance" {
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = var.security_group_id
    key_name = var.key_name

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
        inline = ["chmod +x /tmp/dsa_script.sh", join(" ", ["/tmp/dsa_script.sh", var.vm_name])]

        connection {
            type = "ssh"
            user = "ec2-user"
            private_key = file("dsa-lab3.pem")
            host = self.public_ip
        }
    }

    tags = {
        Name = var.vm_name
    }
}