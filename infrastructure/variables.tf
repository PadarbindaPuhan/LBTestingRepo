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


# Add this block if it doesn't already exist
variable "tag_name" {
  description = "Tags to apply to the EC2 instances"
  type        = map(string)
  default     = {}
}