provider "aws" {
  region = var.region
}

data "aws_availability_zones" "available" {
  state = "available"
}

# VPC
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    {
      "Name" = var.tags["name"]
    },
    var.tags,
    {
      "service-type" = "vpc"
    },
    {
      "service-name" = "vpc"
    },
  )
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(split(",", var.public_cidrs), count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
  count             = length(split(",", var.public_cidrs))

  lifecycle {
    create_before_destroy = true
  }

  map_public_ip_on_launch = true
}

resource "aws_subnet" "private" {
  count             = length(split(",", var.private_cidrs))
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = element(split(",", var.private_cidrs), count.index)
  availability_zone = element(data.aws_availability_zones.available.names, count.index)
}

