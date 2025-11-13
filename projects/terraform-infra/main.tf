provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "devops-vpc" }
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = { Name = "public-subnet" }
}

resource "aws_instance" "web" {
  ami           = "ami-0c94855ba95c71c99" # Amazon Linux 2
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  key_name      = "demo-key"
  tags = { Name = "TerraformDemoInstance" }

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl enable httpd
    systemctl start httpd
    echo "<h1>Hello from Terraform Server</h1>" > /var/www/html/index.html
  EOF
}
