resource "aws_vpc" "my_vpc" {
    cidr_block  = "192.168.0.0/16"
    tags        = var.tags
}

resource "aws_subnet" "my_subnet" {
    vpc_id            = aws_vpc.my_vpc.id
    cidr_block        = "192.168.0.0/24"
    availability_zone = var.az
}