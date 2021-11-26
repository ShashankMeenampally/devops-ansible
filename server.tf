provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-04902260ca3d33422"
  instance_type = "t2.small"
  key_name = "gds-import"

  tags = {
    Name = "Gagan-devops-server-v2"
    env = "production"
    owner = "Gagandeep"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /root/inv"
  }
}
