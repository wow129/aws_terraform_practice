resource "aws_network_interface" "my_interface" {
    subnet_id   = aws_subnet.my_subnet.id
    private_ip  = "192.168.0.100"
}

resource "aws_instance" "server" {
    ami                         = var.image
    associate_public_ip_address = "true"
    instance_type               = "t2.micro"
    availability_zone           = var.az
    network_interface {
      network_interface_id      = aws_network_interface.my_interface.id
      device_index              = 0
    }
    root_block_device {
      volume_size = "30"
    }
}