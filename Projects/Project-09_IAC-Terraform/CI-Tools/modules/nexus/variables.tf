variable "sg" {
  description = "SG ID for EC2"
  type = string
}

variable "subnets" {
  type    = list(string)
  default = []
}


variable "ec2_names" {
    description = "EC2 names"
    type = string
    default = "Nexus-Server"
}
variable "mykey" {
    description = "Key pair"
    type = string
    default = "acloud-key.pem"
}

variable "amazon_ami" {
   description = "Amazon Machine image - Amazon linux "
   default = "ami-026b57f3c383c2eec"
}
variable "redhat_ami"  {
  description = "Amazon Machine image - RedHat Enterprise Linux "
  default = "ami-026ebd4cfe2c043b2"
}
variable "ubuntu_ami" {
  description = "Amazon Machine image - Ubuntu"
  default = "ami-0fc5d935ebf8bc3bc"
} 
