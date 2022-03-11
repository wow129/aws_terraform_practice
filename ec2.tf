resource "aws_instance" "server" {
    ami                         = var.image
    associate_public_ip_address = "true"
    instance_type               = "t2.micro"
    availability_zone           = var.az
    root_block_device {
      volume_size = "30"
    }
    key_name = "terraform-key"
    security_groups = [aws_security_group.terraform_practice.name]
}