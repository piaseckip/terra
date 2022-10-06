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

variable "ami_ubuntu" {
  description = "Default ami of ubuntu image"
}

variable "ssh_key" {
  description = "Main key used for ec2 instances"
}

variable "docker_config_file" {
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
variable "subnets_id" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}
variable "sg_id" {
  type = string
}