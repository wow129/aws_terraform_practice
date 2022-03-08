variable "region" {
    type = string
    default = "us-west-2"
}
variable "image" {
    type = string
    default = "ami-01977bc15980f9223"
}

variable "tags" {
    type = map
    default = {
        Environment = "terraform practice"
    }
}

variable "az" {
    type = string
    default = "us-west-2a"
}