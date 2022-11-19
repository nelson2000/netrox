
variable "priv_key" {
        default = "key.pem"
}

variable "pub_key" {
        default = "key-p.pem"
}

variable "ami-names" {
        type = map

        default = {

                amazonLinux1 = "ami-094125af156557ca2"  

                amazonLinux2 = "ami-08e4eaf54ff5ee95e"  

                redhat9 = "ami-0b6ce9bcd0a2f720d" 

                ubuntu22 = "ami-017fecd1353bcc96e" 

                ubuntu20 = "ami-0c09c7eb16d3e8e70" 

               ubuntu18 = "ami-000340e2c761dddcd"

                debian11 = "ami-071e6cafc48327ca2"

                amazonLinux3 = "ami-081aaface2871d0d0"      

        }
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
        type = string
        default = "t2.micro"
        }

variable "region" {
        default = "us-west-2"
}

variable "instance_count" {
   default = 1
}

