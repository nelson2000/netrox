  GNU nano 2.9.3                                                                     vars.tf                                                                     Modified

variable "priv_key" {
        default = "key.pem"
}

variable "pub_key" {
        default = "key-p.pem"
}

variable "ami-names" {
        type = map
}

variable "zone_names" {
        type = map

}

variable instance_type {
        description = "Type of EC2 instance to provision"
        default = "t2.micro"
        }

variable "region" {
        default = "us-west-2"
}

variable "instance_count" {
   default = 1
}

