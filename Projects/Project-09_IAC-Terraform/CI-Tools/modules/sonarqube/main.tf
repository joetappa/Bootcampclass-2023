resource "aws_instance" "sonarqube" {
  ami = var.redhat_ami
  instance_type = "t2.medium"
  associate_public_ip_address = true
  key_name = var.mykey
  vpc_security_group_ids = [var.sg]
subnet_id = var.subnets[0]
availability_zone = data.aws_availability_zones.available.names[0]
  user_data = filebase64("./userdata/sonarqube-script.sh")
  
  tags = {
    Name = var.ec2_names
  }
}