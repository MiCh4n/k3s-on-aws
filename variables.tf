// provider stuff
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}
// network stuff
variable "vpc_cidr" {
  description = "cidr block for vpc"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "cidr block for subnet"
  type        = string
  default     = "10.0.0.0/24"
}

variable "private_ip_instance" {
  description = "private ip for instace EC2"
  type        = string
  default     = "10.0.0.12"
}
// instance stuff
variable "key" {
  description = "key name for instace"
  type        = string
  default     = "k3s" //in my case its default
}