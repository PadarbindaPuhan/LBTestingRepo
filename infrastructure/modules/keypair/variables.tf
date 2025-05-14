variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}

variable "public_key" {
  description = "The public key to use for the key pair"
  type        = string  
  
}

variable "environment" {
  description = "The environment to deploy to"
  type        = string
  
}