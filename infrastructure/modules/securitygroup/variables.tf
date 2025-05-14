variable "cidr_blocks" {
  description = "CIDR block for inbound rule of the security group"
  type        = list(string)
  default = ["0.0.0.0/0"]
}

variable "vpc_id" {
  description = "The VPC ID to launch the security group"
  type        = string
  default = "vpc-00a987aa746355d96"
}

variable "environment" {
  description = "The environment to deploy to"
  type        = string
}