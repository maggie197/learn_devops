# Specify the provider
provider "aws" {
  region = "eu-west-2"  # Set the region where you want to launch the instance
}

# Create a security group
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust this for security, e.g., set your IP
  }

  ingress {
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust this for security if needed
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # This is an Ubuntu AMI (replace with your preferred AMI)
  instance_type = "t2.micro"

  # Security group association
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  # Key pair to access the instance
  key_name = "my-key"  # Replace with the name of your AWS key pair

  tags = {
    Name = "Terraform-Instance"
  }
}

# Output instance details
output "instance_public_ip" {
  value = aws_instance.my_instance.public_ip
}

output "instance_id" {
  value = aws_instance.my_instance.id
}
