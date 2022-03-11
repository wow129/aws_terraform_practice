resource "aws_instance" "server" {
    ami                         = var.image
    associate_public_ip_address = "true"
    instance_type               = "t2.micro"
    root_block_device {
      volume_size = "30"
    }
    key_name = "terraform-key"
    subnet_id = aws_subnet.terraform.id
    tags = {
      Name = "Terraform EC2"
    }
}