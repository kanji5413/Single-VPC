

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-public-route"
    }
  )
}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id  

  route {
        cidr_block = "0.0.0.0/0"
            gateway_id = "${aws_nat_gateway.nat_az1.id}"
    }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-private-route"
    }
  )
}


resource "aws_route_table" "database" {
  vpc_id = aws_vpc.main.id  

  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_nat_gateway.nat_az2.id}"
    }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-database-route"
    }
  )
}

resource "aws_route_table_association" "app_private_subnet_rt_az1" {
  subnet_id      = aws_subnet.app-private_subnet_az1.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "app_private_subnet_rt_az2" {
  subnet_id      = aws_subnet.app-private_subnet_az2.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "public_subnet_rt_az1" {
  subnet_id      = aws_subnet.public_subnet_az1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_rt_az2" {
  subnet_id      = aws_subnet.public_subnet_az2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "database_subnet_rt_az1" {
  subnet_id      = aws_subnet.db-private_subnet_az1.id
  route_table_id = aws_route_table.database.id
}

resource "aws_route_table_association" "database_subnet_rt_az2" {
  subnet_id      = aws_subnet.db-private_subnet_az2.id
  route_table_id = aws_route_table.database.id
}

