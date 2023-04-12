resource "aws_vpc" "ef_vpc" {
cidr_block    = "${var.ef_vpc_cidr}"
instance_tenancy = "default"

tags = {
    Name = "ef-vpc"
}
}

resource "aws_internet_gateway" "igw" {
vpc_id  = aws_vpc.ef_vpc.id

tags = {
    Name = "igw"
}
}
 

 resource "aws_route_table"  "routetable" {
 vpc_id  = aws_vpc.ef_vpc.id
 route {
cidr_block =  "0.0.0.0/0"
gateway_id = aws_internet_gateway.igw.id
 }

 tags = {
Name = "routetable"
 }
 }

