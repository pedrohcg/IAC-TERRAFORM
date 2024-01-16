resource "aws_security_group" "permit_ssh" {
    name = var.name
    description = "Security Group EC2 Instance"

    # Regra de entrada
    ingress {
        description = "Inbound Rule"
        from_port = var.ingress_from_port
        to_port = var.ingress_to_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    # Regra de saída
    egress {
        description = "Outbound Rule"
        from_port = var.egress_from_port
        to_port = var.egress_to_port
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}