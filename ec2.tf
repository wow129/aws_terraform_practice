resource "aws_instance" "server" {
    name                        = "terraform practice"
    ami                         = var.image
    associate_public_ip_address = "true"
    instance_type               = "t2.micro"
    availability_zone           = var.az
    root_block_device {
      volume_size = "30"
    }
    key_name = "terraform-key"
    security_groups = [aws_security_group.allow_rdp.name, aws_security_group.allow_http.name, aws_security_group.allow_https.name]
}

resource "aws_security_group" "allow_rdp" {
 name = "allow_rdp"
 description = "Allow rdp traffic"

  ingress {
    from_port = 3389
    to_port = 3389
    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_http" {
 name = "allow_http"
 description = "Allow http traffic"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_https" {
 name = "allow_https"
 description = "Allow https traffic"

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "allow_all_out" {
  name = "allow all out"
  description = "Allow all outbound traffic"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    
    cidr_blocks = ["0.0.0.0/0"]
  }
}