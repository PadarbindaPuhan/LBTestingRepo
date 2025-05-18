variable "environment" {
  description = "The environment to deploy to"
  type        = string
}

variable "keypair_public_key" {
  description = "The public key to use for the key pair"
  type        = string
}

variable "blue_servers" {
  type    = list(string)
  default = ["blue-1", "blue-2"]
}

variable "green_servers" {
  type    = list(string)
  default = ["green-1", "green-2"]
}