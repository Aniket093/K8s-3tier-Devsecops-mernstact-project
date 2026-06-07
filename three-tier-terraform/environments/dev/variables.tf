variable "region" {
  description = "AWS region"
  type        = string
}

variable "jenkins_key_name" {
  description = "EC2 Key Pair name for Jenkins SSH access"
  type        = string
}