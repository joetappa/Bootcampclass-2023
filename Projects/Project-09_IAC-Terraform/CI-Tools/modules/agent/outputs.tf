output "instances" {
  value = aws_instance.tomcat.*.id
}

output "Tomcat-DNS_Name" {
  value = aws_instance.tomcat.public_dns
}
output "Tomcat-ip_address" {
  value = aws_instance.tomcat.public_ip
}

