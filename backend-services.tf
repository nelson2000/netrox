#creating subnet group for rds
resource "aws_db_subnet_group" "netrox-rds-subgrp" {
    name = "netrox-rds-subgr"
    subnet_ids = [ module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]  ]
}

#creating subnet group for elasticache
resource "aws_elasticache_subnet_group" "netrox-ecache-subgrp" {
    name = "netrox-ecache-subgrp"
    subnet_ids = [ module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]  ]
}

#creating the rds instance
resource "aws_db_instance" "netrox-rds" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = var.dbname
  username             = var.dbuser
  password             = var.dbpass
  parameter_group_name = "default.mysql5.7"
  multi_az             = false
  publicly_accessible  = false
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.netrox-rds-subgrp.name
  vpc_security_group_ids = [aws_security_group.netrox-backend-sg.id] 

}

#creating elasticache
resource "aws_elasticache_cluster" "netrox-cache" {
  cluster_id           = "netrox-cache"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.memcached1.5"
  port                 = 11211
  subnet_group_name    = aws_elasticache_subnet_group.netrox-ecache-subgrp.name
  security_group_ids   = [aws_security_group.netrox-backend-sg.id]

}

#creating active_mq
resource "aws_mq_broker" "netrox-rmq" {
  broker_name           = "netrox-rmq"
  engine_type           = "ActiveMQ"
  engine_version        = "5.15.9"
  host_instance_type    = "mq.t2.micro"
  security_groups       = [aws_security_group.netrox-backend-sg.id]
  subnet_ids            = [module.vpc.private_subnets[0]]
  user {
    username = var.rmquser
    password = var.rmqpass
  }
}