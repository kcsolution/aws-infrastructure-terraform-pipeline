// Global variables

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

variable "bastion_sg_id" {
  description = "Bastion security group ID"
  default = "sg-0b073295c5fd58522"
}

variable "jenkins_username" {
  description = "Jenkins username"
  default = "kleber"
  
}

variable "jenkins_password" {
  description = "Jenkins password"
  default ="@Vilarim21"
}

variable "jenkins_credentials_id" {
  description = "Slaves SSH ID"
  default = ""
}

variable "vpc_id" {
  description = "VPC ID"
  default = "vpc-05d26102661498f34"
}

variable "vpc_private_subnets" {
  description = "List of VPC private subnets"
  type        =  list
  default = ["subnet-0e4d3d2c0ce149490", "subnet-0a18b668433fd649b"]
  //default = ["private_10.0.0.0_us-east-2a","private_10.0.2.0_us-east-2b"]
}

variable "vpc_public_subnets" {
  description = "List of VPC Public subnets"
  type        = list
  default = ["subnet-0f0fa75ba92e60388", "subnet-049d12f3d07676792"]
  //default = ["public_10.0.1.0_us-east-2a", "public_10.0.3.0_us-east-2b"]
  
}

variable "hosted_zone_id" {
  description = "Zarpsytem.com route53 zone id"
  default = "Z07793542G5QMBV9P5RXM"
}

variable "ssl_arn" {
  description = "SSL certificate"
  default = "arn:aws:acm:us-east-2:255869724753:certificate/c69481d3-0194-40dd-88a2-fa435645de92"
}

// Default variables

variable "vpc_cidr_block" {
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "key_name" {
  description = "SSH KeyPair"
  default = "zs-devops"
}

// Jenkins Master

variable "jenkins_master_instance_type" {
  description = "Jenkins Master instance type"
  default     = "t2.large"
}

// Jenkins Slaves

variable "jenkins_slave_instance_type" {
  description = "Jenkins Slave instance type"
  default     = "t2.micro"
}

variable "min_jenkins_slaves" {
  description = "Min slaves"
  default     = "3"
}

variable "max_jenkins_slaves" {
  description = "Max slaves"
  default     = "5"
}

// Nexus

variable "nexus_instance_type" {
  description = "Nexus instance type"
  default     = "t2.xlarge"
}
