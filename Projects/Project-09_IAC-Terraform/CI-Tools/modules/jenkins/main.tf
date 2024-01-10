resource "aws_instance" "jenkins" {
  ami = var.ubuntu_ami
  instance_type = "t2.medium"
  key_name = var.mykey
  associate_public_ip_address = true
  vpc_security_group_ids = [var.sg]
  subnet_id = var.subnets[0]
  availability_zone = data.aws_availability_zones.available.names[0]
  user_data = filebase64("./userdata/ubuntu-jenkins-docker.sh")
  
  tags = {
    Name = var.ec2_names
  }
}