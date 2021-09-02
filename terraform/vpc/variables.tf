//Global variables
variable "region" {
  description = "AWS region"
  default = "us-east-2"
}

variable "shared_credentials_file" {
  description = "AWS credentials file path"
  default = "/home/ec2-user/.aws"
}

variable "aws_profile" {
  description = "AWS profile"
  default = "default"
  
}

variable "hosted_zone_id" {
  description = "Route53 zone id"
  ##default = "aws_route53_zone.example.id"
   default = "Z07793542G5QMBV9P5RXM"
  
}

variable "bastion_key_name" {
  description = "Bastion KeyName"
  default = "zs-devops"
}

variable "availability_zones" {
  type        = list
  default     = ["us-east-2a","us-east-2b","us-east-2c"]
  description = "List of Availability Zones"
}

// Default variables
variable "vpc_name" {
  description = "VPC name"
  default     = "Devops-zarp"
}

variable "cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "public_count" {
  default     = 2
  description = "Number of public subnets"
}

variable "private_count" {
  default     = 2
  description = "Number of private subnets"
}

variable "bastion_instance_type" {
  description = "Bastion Instance type"
  default     = "t2.micro"
}
