variable "sg" {
    type = string
    description = "sec_grp"
}

variable "server-ports" {
  type = list(number)
  description = "server-sg-gr-inbound-rules"
}

variable "vpc_id" {
  description = "VPC ID for Security Group"
  type = string
}