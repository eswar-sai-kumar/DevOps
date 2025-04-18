resource "aws_instance" "db"{
    ami = var.image_id
    instance_type = var.instance_name == "db" ? "t3.small":"t3.micro" # if instance name is db, it will take t3.small, otherwise t3.micro
}