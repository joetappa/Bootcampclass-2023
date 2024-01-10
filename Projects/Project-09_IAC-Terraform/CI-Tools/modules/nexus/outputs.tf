output "instances" {
  value = aws_instance.nexus.*.id
}
output "Nexus-DNS_Name" {
  value = aws_instance.nexus.public_dns
}
output "Nexus-ip_address" {
  value = aws_instance.nexus.public_ip
}