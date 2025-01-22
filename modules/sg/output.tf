output "security_group_id" {
  value = aws_security_group.all_worker_mgmt.id
}

output "security_group_arn" {
  value = aws_security_group.all_worker_mgmt.arn
}