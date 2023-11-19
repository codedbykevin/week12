module "ec2" {
  source        = "../modules/ec2"
  region        = "us-east-1"
  ami           = "ami-05c13eab67c5d8861"
  instance_type = "t3.small"
  name          = "DEV-from module"
}

output "public-ip" {
  value = module.ec2.public-ip
}