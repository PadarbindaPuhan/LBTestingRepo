variable "environment" {
  description = "The environment to deploy to"
  type        = string
}

variable "keypair_public_key" {
  description = "The public key to use for the key pair"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}