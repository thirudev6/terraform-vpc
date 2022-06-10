resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = join("-", [var.project, "vpc"])
  }

}
resource "aws_subnet" "pub" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.pub_cidr
tags = {
    Name = join("-", [var.project, "public-subnet-1a"])
  }

}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_cidr

tags = {
    Name = join("-", [var.project, "public-subnet-1b"])
  }
}

resource "aws_subnet" "node-pri1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.node-pri1_cidr

tags = {
    Name = join("-", [var.project, "private-subnet-1a"])
  }
}
resource "aws_subnet" "node-pri2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.node-pri2_cidr

tags = {
    Name = join("-", [var.project, "private-subnet-1a"])
  }
}
resource "aws_subnet" "tomcat-pri1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.tomcat-pri1_cidr

tags = {
    Name = join("-", [var.project, "private-subnet-1a"])
  }
}
resource "aws_subnet" "tomcat-pri2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.tomcat-pri2_cidr

tags = {
    Name = join("-", [var.project, "private-subnet-1a"])
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

tags = {
    Name = join("-", [var.project, "igw"])
  }
}
resource "aws_eip" "lb" {
    vpc      = true
  }
  resource "aws_nat_gateway" "ngw" {
    allocation_id = aws_eip.lb.id
    subnet_id     = aws_subnet.public.id
  
  tags = {
    Name = join("-", [var.project, "nat"])
  }

   }
     resource "aws_route_table" "rt1" {
        vpc_id = aws_vpc.vpc.id
      
    route {
          cidr_block = "0.0.0.0/0"
          gateway_id = aws_internet_gateway.gw.id
    }
     tags = {
    Name = join("-", [var.project, "public-route-table"])
  }
    }
 
    resource "aws_route_table" "rt2" {
        vpc_id = aws_vpc.vpc.id
    route {
          cidr_block = "0.0.0.0/0"
          gateway_id = aws_nat_gateway.ngw.id
    }
tags = {
    Name = join("-", [var.project, "private-route-table"])
  }
  }
    
    resource "aws_route_table_association" "route2" {
        subnet_id      = aws_subnet.node-pri1.id
        route_table_id = aws_route_table.rt2.id
      }

    resource "aws_security_group" "sg" {
        name        = join("-", [var.project, "sample-sg"])
        description = "Allow TLS inbound traffic"
        vpc_id      = aws_vpc.vpc.id
      
        ingress {
          description      = "TLS from VPC"
          from_port        = 22
          to_port          = 22
          protocol         = "tcp"
          cidr_blocks      = [aws_vpc.vpc.cidr_block]
        }
      
        egress {
          from_port        = 0
          to_port          = 0
          protocol         = "-1"
          cidr_blocks      = ["0.0.0.0/0"]
        }
      
   tags = {
    Name = join("-", [var.project, "sample-sg"])
  }
      }
      
