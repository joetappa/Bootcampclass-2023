output "instances" {
  value = aws_instance.sonarqube.*.id
}
output "Sonarqube-DNS_Name" {
  value = aws_instance.sonarqube.public_dns
}
output "Sonarqube-ip_address" {
  value = aws_instance.sonarqube.public_ip
}