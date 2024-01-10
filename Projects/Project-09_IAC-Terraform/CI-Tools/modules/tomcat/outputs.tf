output "instances" {
  value = aws_instance.agent.*.id
}
