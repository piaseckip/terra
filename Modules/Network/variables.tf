variable "region" {
  description = "Region for our AWS services"
}

variable "zoneA" {
  description = "First AZ of region"
}

variable "zoneB" {
  description = "Second AZ of region"
}

variable "name" {
  description = "Value for created_by tag"
}

variable "bootcamp" {
  description = "Value for bootcamp tag"
}

variable "tags" {
  description = "Tags for ec2 instances and its volumes"
} 