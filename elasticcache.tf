# is used to create elastic cache and its resources
resource "aws_elasticache_cluster" "theo_elastic_cluster" {
  cluster_id           = "theo-elastic-cache-cluster"
  engine               = "memcached"
  node_type            = "cache.m4.large"
  num_cache_nodes      = 2
  parameter_group_name = "default.memcached1.4"
  port                 = 11211
  security_group_ids = [aws_security_group.theo-security-group-alb-ec-2.id]
  availability_zone = "us-east-1a"
}
