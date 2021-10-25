name = "test-sg"

description = "A Test for the tf-module"

ingress_rules = [
  {
    rule        = "ssh-tcp",
    description = "Allow ssh access to resource.",
    cidr_blocks = "0.0.0.0/0"
  }
]

egress_rules = [
  {
    rule        = "postgresql-tcp"
    cidr_blocks = "0.0.0.0/0,2.2.2.2/32"
  },
]

vpc_id = "vpc-3f5bf842"

region = "us-east-1"