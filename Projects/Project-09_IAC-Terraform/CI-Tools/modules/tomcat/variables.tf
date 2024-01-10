variable "sg" {
  description = "SG ID for EC2"
  type = string
}

variable "subnets" {
  description = "Subnets for EC2"
  type = list(string)
}

variable "mykey" {
    description = "Key pair"
    type = string
    default = "acloud-key.pem"
}

variable "agent_names" {
    description = "EC2 names"
    type = list(string)
    default = ["Tomcat-UAT", "Tomcat-Prod"]
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
