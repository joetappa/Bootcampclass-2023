output "vpc_id" {
    value = aws_vpc.my_vpc.id
}

output "subnet_ids" {
  description = "List of subnet IDs"
  value       = [for subnet in values(aws_subnet.subnets) : subnet.id]
}
