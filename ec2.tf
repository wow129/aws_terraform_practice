resource "aws_instance" "server" {
    ami                         = var.image
    associate_public_ip_address = "true"
    instance_type               = "t2.micro"
    availability_zone           = var.az
    root_block_device {
      volume_size = "30"
    }
    #key_name = "terraform-key"
    security_groups = [aws_security_group.allow_rdp.name]
}

#resource "aws_security_group" "allow_rdp" {
 # name = "allow_rdp"
  #description = "Allow rdp traffic"

  #ingress {
   # from_port = 3389
    #to_port = 3389
    #protocol = "tcp"

    #cidr_blocks = ["0.0.0.0/0"]
  #}
#}