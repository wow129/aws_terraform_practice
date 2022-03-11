resource "aws_vpc" "terraform" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "Terraform VPC"
    }
}

resource "aws_subnet" "terraform" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.terraform.id
    tags = {
        Name = "Terraform Subnet"
    }
}

resource "aws_internet_gateway" "terraform" {
    vpc_id = aws_vpc.terraform.id
    tas = {
        Name = "Terraform Gateway"
    }
}