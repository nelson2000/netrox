module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc-name
  cidr = var.vpc-cidr

  azs                 = [var.zone1, var.zone2, var.zone3, var.zone4]
  private_subnets     = [var.Sub1cidr_pub, var.Sub2cidr_pub, var.Sub3cidr_pub]
  public_subnets      = [var.Sub1cidr_prv, var.Sub2cidr_prv, var.Sub3cidr_prv]
 
  

  enable_dns_hostnames = true
  enable_dns_support   = true
  enable_nat_gateway = true
  single_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
     Terraform = "true"
     Environment = "Prod"

  }

vpc_tags = {
    Name = var.vpc-name
}


}