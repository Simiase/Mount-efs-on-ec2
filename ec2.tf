resource "aws_instance" "instancea" {
ami                             = "ami-06e46074ae430fba6"
instance_type                   = "t2.micro"
subnet_id                       = aws_subnet.subneta.id
vpc_security_group_ids          = [aws_security_group.sg.id]
associate_public_ip_address     =  "true"
key_name                        = "ec2key"



tags ={
Name       = "instancea"
}

}

resource "aws_instance" "instanceb" {
ami                               = "ami-06e46074ae430fba6"
instance_type                     = "t2.micro"
subnet_id                         = aws_subnet.subnetb.id
vpc_security_group_ids            = [aws_security_group.sg.id]
associate_public_ip_address       =  "true"
key_name                          = "ec2key"


tags ={
Name       = "instanceb"
}
}

output "public_ipv4_address" {
 value =  aws_instance.instanceb.public_ip
}