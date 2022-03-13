resource "aws_vpc" "terraform" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Terraform VPC"
    }
}

resource "aws_subnet" "terraform" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.terraform.id
    availability_zone = var.az
    tags = {
        Name = "Terraform Subnet"
    }
}

resource "aws_internet_gateway" "terraform" {
    vpc_id = aws_vpc.terraform.id
    tags = {
        Name = "Terraform Gateway"
    }
}

resource "aws_route_table" "terraform" {
    vpc_id = aws_vpc.terraform.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.terraform.id
    }
}

# add internet route to subnet