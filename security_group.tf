resource "aws_security_group" "terraform_practice" {
    name = "Terraform Practice"
    description = "Security group while practicing terraform."
    vpc_id = aws_vpc.terraform.id
}

resource "aws_security_group_rule" "allow_http" {
    type = "ingress"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = var.all_ips
    security_group_id = aws_security_group.terraform_practice.id
    description = "Allow all ingress HTTP traffic"
}

resource "aws_security_group_rule" "allow_https" {
    type = "ingress"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = var.all_ips
    security_group_id = aws_security_group.terraform_practice.id
    description = "Allow all ingress HTTPS traffic"
}

resource "aws_security_group_rule" "allow_ssh" {
    type = "ingress"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = var.my_ip
    security_group_id = aws_security_group.terraform_practice.id
    description = "Allow ingress SSH traffic for me"
}

resource "aws_security_group_rule" "allow_all_out" {
    type = "egress"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = var.all_ips
    security_group_id = aws_security_group.terraform_practice.id
    description = "Allow all egress traffic"
}