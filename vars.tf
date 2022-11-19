
variable "priv_key" {
        default = "key.pem"
}

variable "pub_key" {
        default = "key-p.pem"
}

variable "ami-names" {
        type = map
}

variable "zone1" {
        description = "availability zone"
        type = string
        default = "us-west-2a"

}

variable "zone2" {
        description = "availability zone"
        type = string
        default = "us-west-2b"
}

variable "zone3" {
        description = "availability zone"
        type = string
        default = "us-west-2c"        

}
variable "zone4" {
        description = "availability zone"
        type = string
        default = "us-west-2d"        

}

variable instance_type {
        description = "Type of EC2 instance"
        default = "t2.micro"
        }

variable "region" {
        default = "us-west-2"
}

variable "instance_count" {
   default = 1
}

