resource "aws_instance" "tomcat" {
  ami = var.redhat_ami
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = [var.sg]
  key_name = var.mykey
  subnet_id = var.subnets[0]
  availability_zone = data.aws_availability_zones.available.names[0]
  user_data = filebase64("./userdata/agent-script.sh")
  
  tags = {
    Name = var.ec2_names
  }
}