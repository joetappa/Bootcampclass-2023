resource "aws_instance" "agent" {
  count = length(var.agent_names)
  ami = var.redhat_ami
  key_name = var.mykey
  instance_type = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids = [var.sg]
  subnet_id = var.subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  user_data = filebase64("./userdata/tomcat-script.sh")
  
  tags = {
    Name = var.agent_names[count.index]
  }
}