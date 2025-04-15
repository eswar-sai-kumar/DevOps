locals{
  ami_id = "ami-09c813fb71547fc4f"
  sg_id = "sg-0f08a3ce729bd0d43" 
  instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"
  tags = {
    Name = "locals"
  }
}