variable "project_name" {
  type    = string
  default = "three-tier"
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "EC2 Key Pair name for SSH access"
}

variable "cluster_name" {
  type = string
}

variable "region" {
  type = string
}
