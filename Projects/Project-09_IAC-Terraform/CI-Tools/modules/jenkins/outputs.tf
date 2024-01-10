output "instances" {
  value = aws_instance.jenkins.*.id
}
output "Jenkins-DNS_Name" {
  value = aws_instance.jenkins.public_dns
}
output "Jenkins-ip_address" {
  value = aws_instance.jenkins.public_ip
}