variable "description" {
  description = "Description of the SG."
  type        = string
}

variable "egress_rules" {
  description = "A map of egress rules"
  type        = list(map(string))
  default     = []
}

variable "egress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = []
}

variable "ingress_rules" {
  description = "A map of ingress rules"
  type        = list(map(string))
  default     = []
}

variable "ingress_cidr_blocks" {
  description = "List of IPv4 CIDR ranges to use on all ingress rules"
  type        = list(string)
  default     = []
}

variable "name" {
  description = "Name of the SG"
  type        = string
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(any)
  default     = {}
}

variable "vpc_id" {
  description = "VPC ID to deploy the SG"
  type        = string
}

variable "region" {
  description = "Deployment region for AWS resources"
  type        = string
}