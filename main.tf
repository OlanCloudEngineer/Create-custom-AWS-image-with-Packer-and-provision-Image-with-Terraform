provider "aws" {
  region = "us-east-2"
//  access_key = ""
//  secret_key = ""
 }

resource "aws_instance" "olankey" {
  key_name = aws_key_pair.olankey.key_name
  ami = "ami-0379305d415b17cfb" #custom packer image
  instance_type = "t2.micro"

   tags = {
	Name = "Sandbox Server"
    }
}

resource "aws_key_pair" "olankey" {
    key_name = "olankey1"
    public_key = file("olankey.pub") #Stored Local SSH Public key
}

resource "aws_security_group" "olankey" {

# Allow Inbound traffic from the ELB Security-Group
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
   cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol = "-1" 
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]  
  }
}
