module "docker" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "docker"

  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0fb4314a3e3c19b76"] #replace your SG
  subnet_id = "subnet-026fa8e1dc737230f" #replace your Subnet
  ami = data.aws_ami.ami_info.id
  tags = {
    Name = "docker"
  }
}

