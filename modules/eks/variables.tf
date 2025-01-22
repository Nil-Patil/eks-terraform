variable "cluster_name" {
    type = string
}
variable "kubernetes_version" {
    type = string
}
variable "vpc_id" {
    type = string
}
variable "private_subnets" {
    type = list(string)
}
variable "tags" {
    type = map(string)
}
variable "vpc_security_group_ids" {
    type = list(string)
}
variable "ami_type" {
    type = string
}
variable "instance_types" {
    type = list(string)
}
variable "eks_min_size" {
    type = number
}
variable "eks_max_size" {
    type = number
}
variable "eks_desire_size" {
    type = number
}