resource "aws_security_group" "netrox-bean-elb-sg" {
  name        = "netrox-bean-elb-sg"
  description = "Security group for bean-elb"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "http from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bean-sg"
  }
}

resource "aws_security_group" "netrox-bastion-sg" {
  name        = "netrox-bastion-sg"
  description = "Security group for bastionhost"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "ssh from my host ip"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.my-ip]
  
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastionhost-sg"
  }
}


resource "aws_security_group" "netrox-prod-sg" {
  name        = "netrox-prod-sg"
  description = "Security group for beanstalk instance"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "ssh from bastion host"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups      = [aws_security_group.netrox-bastion-sg.id]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "prod-instance-sg"
  }
}

resource "aws_security_group" "netrox-backend-sg" {
  name        = "netrox-backend-sg"
  description = "Security group for RDS, active mq, elastic cache"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description      = "ssh from bastion host"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    security_groups      = [aws_security_group.netrox-prod-sg.id]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "backend-instance-sg"
  }
}

resource "aws_security_group_rule" "sec_group_allow_itself" {
    description                 = " to allow the databases communicate within themselves in the backend"
    type                        = "ingress"
    from_port                   = 0
    to_port                     = 65535
    protocol                    = "tcp"
    security_groups_id          = [aws_security_group.netrox-prod-sg.id]
    source_security_groups_id   =  [aws_security_group.netrox-prod-sg.id]

}

