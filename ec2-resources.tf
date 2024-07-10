# Public subnet EC2 instance 1
# Make sure to put your own key and ami
resource "aws_instance" "two-tier-web-server-1" {
  ami             = "ami-06c68f701d8090592"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.two-tier-ec2-sg.id]
  subnet_id       = aws_subnet.two-tier-pub-sub-1.id
  key_name   = "testKP"

  tags = {
    Name = "two-tier-web-server-1"
  }

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
EOF
}

# Public subnet  EC2 instance 2
# Make sure to put your own key and ami
resource "aws_instance" "two-tier-web-server-2" {
  ami             = "ami-06c68f701d8090592"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.two-tier-ec2-sg.id]
  subnet_id       = aws_subnet.two-tier-pub-sub-2.id
  key_name   = "testKP"

  tags = {
    Name = "two-tier-web-server-2"
  }

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
EOF
}
