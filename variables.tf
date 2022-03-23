variable "region" {
    type = string
    description = "AWS region"
}
variable "image" {
    type = string
    description = "EC2 Image AMI"
}

variable "az" {
    type = string
    description = "AWS availability zone"
}

variable "all_ips" {
    type = list
    description = "CIDR list that covers all IP4 CIDR addresses"
}

variable "my_ip" {
    type = list
    description = "Public IP address of my computer"
}