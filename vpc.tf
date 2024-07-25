resource "aws_vpc" "this" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "vpc-a"
  }

}


resource "aws_subnet" "pri_sn_az1" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "vpca-pri-sn-az1"
  }
}

#create a route table for private subnet
resource "aws_route_table" "pri_rt_az1" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "vpca-pri-rt-az1"
  }
}
resource "aws_subnet" "pri_sn_az2" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "vpca-pri-sn-az2"
  }
}

#create a route table for private subnet
resource "aws_route_table" "pri_rt_az2" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "vpca-pri-rt-az2"
  }
}

# #associate private route table to private subnet
# resource "aws_route_table_association" "pri_rta1_az1" {
#   subnet_id      = aws_subnet.pri_sn_az1.id
#   route_table_id = aws_route_table.pri_rt_az1.id
# }

# #create a vpc interface endpoint for Session Manager 

# resource "aws_vpc_endpoint" "ssm_ep" {
#   vpc_endpoint_type   = "Interface"
#   private_dns_enabled = true
#   service_name        = "com.amazonaws.${var.region}.ssm"
#   vpc_id              = aws_vpc.vpc_a.id
#   subnet_ids          = [aws_subnet.pri_sn_az1.id]
#   security_group_ids  = [aws_security_group.ssm_ep_sg.id]
#   tags = {
#     Name = "vpca-ssm-endpoint"
#   }
# }
# resource "aws_vpc_endpoint" "ssm_messages_ep" {
#   vpc_endpoint_type   = "Interface"
#   private_dns_enabled = true
#   service_name        = "com.amazonaws.${var.region}.ssmmessages"
#   vpc_id              = aws_vpc.vpc_a.id
#   subnet_ids          = [aws_subnet.pri_sn_az1.id]
#   security_group_ids  = [aws_security_group.ssm_ep_sg.id]
#   tags = {
#     Name = "vpca-ssm-messages-endpoint"
#   }
# }