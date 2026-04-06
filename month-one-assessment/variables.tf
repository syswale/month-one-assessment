# variables.tf

variable "aws_region" {
  description = "The AWS region to deploy the infrastructure in"
  type        = string
  default     = "us-east-1"
}

variable "my_ip_address" {
  description = "Your current IP address to allow SSH access to the Bastion host"
  type        = string
}

variable "key_pair_name" {
  description = "The name of the existing EC2 Key Pair to use for SSH access"
  type        = string
}

variable "bastion_instance_type" {
  description = "Instance type for the Bastion Host"
  type        = string
  default     = "t3.micro"
}

variable "web_instance_type" {
  description = "Instance type for the Web Servers"
  type        = string
  default     = "t3.micro"
}

variable "db_instance_type" {
  description = "Instance type for the Database Server"
  type        = string
  default     = "t3.small"
}
