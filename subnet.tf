
resource "aws_subnet" "subneta" {
vpc_id     = aws_vpc.ef_vpc.id
cidr_block = "${var.subneta_cidr}"
availability_zone = "us-east-1a"

tags ={
Name = "subneta"
}
}

resource "aws_route_table_association"  "subnet_associationa" {
subnet_id       = aws_subnet.subneta.id
route_table_id  = aws_route_table.routetable.id
}

resource "aws_subnet" "subnetb" {
vpc_id            = aws_vpc.ef_vpc.id
cidr_block        =  "${var.subnetb_cidr}"
availability_zone = "us-east-1b"

tags ={
Name = "subnetb"
}
}

resource "aws_route_table_association"  "subnet_associationb" {
subnet_id       = aws_subnet.subnetb.id
route_table_id  = aws_route_table.routetable.id
}
