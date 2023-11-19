resource "aws_instance" "web" {
  ami                                  = "ami-0230bd60aa48260c6"
  associate_public_ip_address          = true
  availability_zone                    = "us-east-1d"
  instance_initiated_shutdown_behavior = "stop"
  instance_type                        = "t2.micro"
  ipv6_address_count                   = 0
  key_name                             = "ec2-key"
  monitoring                           = false
  security_groups                      = ["launch-wizard-3"]
  source_dest_check                    = true
  subnet_id                            = "subnet-03a5871ff5332364d"
  tags = {
    Name = "Imported server"
    env  = "dev"
    Team = "devops"
  }
}
