resource "aws_security_group" "test-bastion-sg" {
    name = "test-bastion"
    vpc_id = module.vpc.vpc_id

    ingress {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        # cidr_blocks = module.vpc.public_subnets_cidr_blocks
        cidr_blocks = var.my-ip-address
    }

    egress {
        from_port = 0
        protocol = "-1"
        to_port = 0
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        "Name" = "eks-bastion-sg"
    }
}