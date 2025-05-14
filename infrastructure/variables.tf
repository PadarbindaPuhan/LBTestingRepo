variable "environment" {
  description = "The environment to deploy to"
  type        = string
}

variable "keypair_public_key" {
  description = "The public key to use for the key pair"
  type        = string
}