provider "aws" {
region = "us-east-2"
  access_key = "AKIA2TS6DA2PGJRV7NX4"
  secret_key = "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"`
}
resource "aws_instance" "myawsserver" {
  ami = "ami-077e31c4939f6a2f3"
  instance_type = "t2.small"
  key_name = "gds-import"

  tags = {
    Name = "Gagan-devops-server"
    env = "production"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /root/inv"
  }
}

