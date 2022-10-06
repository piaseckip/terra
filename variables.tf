variable "region" {
  type        = string
  description = "Region for our AWS services"
}

variable "zoneA" {
  type        = string
  description = "First AZ of region"
}

variable "zoneB" {
  type        = string
  description = "Second AZ of region"
}

variable "micro" {
  type        = string
  description = "Micro - size of ec2 aws instance"
}

variable "ami_ubuntu" {
  type        = string
  description = "Default ami of ubuntu image"
}

variable "ssh_key" {
  type        = string
  description = "Main key used for ec2 instances"
}

variable "docker_config_file" {
  type        = string
  description = "File with docker configuration ROOT"
}
variable "name" {
  type        = string
  description = "Value for created_by tag"
}
variable "bootcamp" {
  type        = string
  description = "Value for bootcamp tag"
}
variable "ec2_name" {
  type        = string
  description = "Default name for ec2 instance"
}

variable "tags" {
  type        = map(string)
  description = "Tags for ec2 instances and its volumes"
} 