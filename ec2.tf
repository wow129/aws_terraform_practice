resource "aws_instance" "server" {
    ami             = var.image
    instance_type   = "t3.micro"
    tags            = var.tags
}