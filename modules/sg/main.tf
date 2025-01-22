resource "aws_security_group" "all_worker_mgmt" {
  name        = "all_worker_management"
  vpc_id      = var.vpc_id  
}

resource "aws_security_group_rule" "all_worker_mgnt_ingress" {
  description = "Allow inbount traffic form eks"
  from_port = 0
  protocol = -1
  to_port = 0
  security_group_id = aws_security_group.all_worker_mgmt.id
  type = "ingress"
  cidr_blocks = var.cidr_blocks
}

resource "aws_security_group_rule" "all_worker_mgmt_egress" {
  description       = "allow outbound traffic to anywhere"
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.all_worker_mgmt.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}