resource "aws_subnet" "public_subnet_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-public_subnet_az1"
    }
  )
}


resource "aws_subnet" "public_subnet_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-public_subnet_az2"
    }
  )
}

resource "aws_subnet" "app-private_subnet_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.10.0/24"
  availability_zone       = "us-east-1a"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-private_subnet_az1"
    }
  )
}


resource "aws_subnet" "app-private_subnet_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.20.0/24"
  availability_zone       = "us-east-1b"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-private_subnet_az2"
    }
  )
}

resource "aws_subnet" "db-private_subnet_az1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.100.0/24"
  availability_zone       = "us-east-1a"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-database_subnet_az1"
    }
  )
}

resource "aws_subnet" "db-private_subnet_az2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.1.110.0/24"
  availability_zone       = "us-east-1b"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-database_subnet_az2"
    }
  )
}  