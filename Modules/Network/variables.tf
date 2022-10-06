variable "region" {
  description = "Region for our AWS services"
}

variable "zoneA" {
  description = "First AZ of region"
}

variable "zoneB" {
  description = "Second AZ of region"
}

variable "micro" {
  description = "Micro - size of ec2 aws instance"
}

variable "ami-ubuntu" {
  description = "Default ami of ubuntu image"
}

variable "ssh-key" {
  description = "Main key used for ec2 instances"
}

variable "docker-config-file" {
  description = "File with docker configuration"
}
variable "name" {
  description = "Value for created_by tag"
}
variable "bootcamp" {
  description = "Value for bootcamp tag"
}
variable "ec2_name" {
  description = "Default name for ec2 instance"
}

variable "tags" {
  description = "Tags for ec2 instances and its volumes"
} 