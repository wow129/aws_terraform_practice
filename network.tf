resource "aws_vpc" "my_vpc" {
    cidr_block  = "192.168.0.0/16"
}

resource "aws_subnet" "my_subnet" {
    vpc_id            = aws_vpc.my_vpc.id
    cidr_block        = "192.168.0.0/24"
    availability_zone = var.az
}

resource "aws_security_group" "allow_self" {
    name = "Allow Robert"
    description = "Allow Robert access"
    vpc_id = aws_vpc.my_vpc.id
    ingress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["69.162.230.8/32"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}