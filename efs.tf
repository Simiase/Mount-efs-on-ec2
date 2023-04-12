resource "aws_efs_file_system" "efs" {
  creation_token   = "efs"
  throughput_mode  = "bursting"
  encrypted        = "true"

  tags = {
    Name = "efs"
  }
}

resource "aws_efs_mount_target" "mounta" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = aws_subnet.subneta.id
  security_groups = [aws_security_group.sg.id]
  
}

resource "aws_efs_mount_target" "mountb" {
  file_system_id = aws_efs_file_system.efs.id
  subnet_id      = aws_subnet.subnetb.id
  security_groups = [aws_security_group.sg.id]
}

resource "null_resource" "configure_nfs" {
depends_on = [aws_efs_mount_target.mounta]
connection {
type= "ssh"
user= "ec2-user"
# private_key = tls_private_key.p_key.private_key_pem
host= aws_instance.instancea.private_ip
}


# provisioner "remote-exec" {
#   inline = [
#     "sudo yum install amazon-efs-utils httpd php git -y",
#     "sudo systemctl restart httpd",
#     "sudo systemctl enable httpd",
#     "sudo setenforce 0",
#     "sudo yum install nfs-utils -y",
#     "sudo mount -t nfs4 ${aws_efs_file_system.efs_storage.dns_name}:/ /var/www/html",
#     "sudo echo ${aws_efs_file_system.efs_storage.dns_name}:/ /var/www/html efs defaults_netdev 0 0 >> sudo /etc/fstab",
#   ]
#}

provisioner "remote-exec" {
inline = [
"sudo apt-get update",
"sudo apt-get install --yes nfs-common",
"sudo mkdir /efs",
"sudo chown -R linux /efs",
"sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${aws_efs_file_system.efs.dns_name}:/ /efs",
]
}
}


resource "null_resource" "configure_nfs2" {
depends_on = [aws_efs_mount_target.mountb]
connection {
type= "ssh"
user= "ec2-user"
# private_key = tls_private_key.p_key.private_key_pem
host= aws_instance.instanceb.private_ip
}


# provisioner "remote-exec" {
#   inline = [
#     "sudo yum install amazon-efs-utils httpd php git -y",
#     "sudo systemctl restart httpd",
#     "sudo systemctl enable httpd",
#     "sudo setenforce 0",
#     "sudo yum install nfs-utils -y",
#     "sudo mount -t nfs4 ${aws_efs_file_system.efs_storage.dns_name}:/ /var/www/html",
#     "sudo echo ${aws_efs_file_system.efs_storage.dns_name}:/ /var/www/html efs defaults_netdev 0 0 >> sudo /etc/fstab",
#   ]
#}

provisioner "remote-exec" {
inline = [
"sudo apt-get update",
"sudo apt-get install --yes nfs-common",
"sudo mkdir /efs",
"sudo chown -R linux /efs",
"sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 ${aws_efs_file_system.efs.dns_name}:/ /efs",
]
}
}
