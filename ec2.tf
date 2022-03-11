resource "aws_instance" "server" {
    ami                         = var.image
    associate_public_ip_address = "true"
    instance_type               = "t2.micro"
    root_block_device {
      volume_size = "30"
    }
    key_name = "terraform-key"
    subnet_id = aws_subnet.terraform.id
    vpc_security_group_ids = [aws_security_group.terraform_practice.id]
    tags = {
      Name = "Terraform EC2"
    }
}