resource "aws_instance" "server" {
    ami                         = var.image
    associate_public_ip_address = "true"
    instance_type               = "t2.micro"
    availability_zone           = var.az
    get_password_data           = "true"
    root_block_device {
      volume_size = "30"
    }
    subnet_id                   = aws_subnet.my_subnet.id
    vpc_security_group_ids      = [aws_security_group.allow_self.id]
}