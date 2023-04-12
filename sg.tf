resource "aws_security_group" "sg" {
vpc_id =  aws_vpc.ef_vpc.id

ingress {
    description      = "ssh from instance"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

 ingress {
  description = "efs mount target"
  from_port    = 2049
  to_port      =2049
  protocol     = "tcp"
cidr_blocks    = ["0.0.0.0/0"]
 }

ingress {
description    = "https from vpc"
from_port        = 80
to_port          = 80
protocol         = "tcp"
cidr_blocks      = ["0.0.0.0/0"]
}

egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  tags = {
    Name = "sg"
  }
}


  

