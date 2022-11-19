variable "region" {
        default = "us-west-2"
}
variable "priv_key" {
        default = "key.pem"
}

variable "pub_key" {
        default = "key-p.pem"
}

variable "user_name" {
        default = "vagrant"
}

variable "amis" {
        type = map

        default = {

                us-west-2 = "ami-0c09c7eb16d3e8e70"

                us-west-1 = "ami-017fecd1353bcc96e"
                #amazonLinux1 = "ami-094125af156557ca2"  

                #amazonLinux2 = "ami-08e4eaf54ff5ee95e"  

                #redhat9 = "ami-0b6ce9bcd0a2f720d" 

                #ubuntu22 = "ami-017fecd1353bcc96e" 

                #ubuntu20 = "ami-0c09c7eb16d3e8e70" 

               #ubuntu18 = "ami-000340e2c761dddcd"

                #debian11 = "ami-071e6cafc48327ca2"

                #amazonLinux3 = "ami-081aaface2871d0d0"      

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




variable "my-ip" {
        default = "192.168.20.3/32"
}

variable "rmquser" {
        default = "rabbit"
}

variable "rmqpass" {
        default = "bmVsc29ubndhamll"
}

variable "dbuser" {
        default = "admin"
}


variable "dbpass" {
        default = "admin123"
}

variable "dbname" {
        default = "accounts"
}

variable "instance_count" {
   default = 1
}

variable "vpc_name" {
        default = "netrox-vpc"
}

variable "vpc-cidr" {
        default = "172.21.0.0/16"
}

variable "Sub1cidr_pub" {
        default = "172.21.1.0/24"
}

variable "Sub2cidr_pub" {
        default = "172.21.2.0/24"
}

variable "Sub3cidr_pub" {
        default = "172.21.3.0/24"
}


variable "Sub1cidr_prv" {
        default = "172.21.4.0/24"
}

variable "Sub2cidr_prv" {
        default = "172.21.5.0/24"
}

variable "Sub3cidr_prv" {
        default = "172.21.6.0/24"
}