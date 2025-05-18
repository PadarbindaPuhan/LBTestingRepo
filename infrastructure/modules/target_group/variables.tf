variable "name" {
    description = "The name of the target group"
    type        = string
}

variable "port" {
    description = "The port on which the target group is listening"
    type        = number
  
}

variable "protocol" {
    description = "The protocol used by the target group"
    type        = string

  
}

variable "vpc_id" {
    description = "The VPC ID to launch the target group in"
    type        = string
}

variable "target_ids" {
    description = "The target ID to attach to the target group"
    type        = list(string)
    default     = []
}

