resource "aws_vpc" "main" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    
    tags = merge(
    local.common_tags,
    {
      Name = var.vpc_name
    }
  )
}    