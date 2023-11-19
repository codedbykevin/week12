resource "aws_instance" "web" {
  ami                         = data.aws_ami.ami1.id
  associate_public_ip_address = true
  availability_zone           = "us-east-1a"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.ec2_key.key_name
  security_groups             = ["launch-wizard-3"]
  tags = {
    Name = "provisioner-server"
  }
  depends_on = [aws_key_pair.ec2_key ]
  lifecycle {
    prevent_destroy = false
  }
  
}

resource "null_resource" "name" {
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("week12b.pem")
    host        = self.public_ip
  }
  provisioner "local-exec" {
    command = "echo hello"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "pwd",
      "nproc"
    ]
  }
  provisioner "file" {
    source      = "week12b.pem"
    destination = "/home/ec2-user/week12b.pem"
  }

  depends_on = [ aws_instance.web ]
}