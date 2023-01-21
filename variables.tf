variable "env" {
  description = "Environment"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-central-1"
}

variable "is_temporary" {
  description = "Set to true if this resource created temporary and should be removed after var.delete_after"
  type        = bool
  default     = false
}

variable "delete_after" {
  description = "Last day of resource existing if is_temporary == true. Format dd.mm.yyyy. If resource is not temporary, then default values is valid (-)"
  type        = string
  default     = "-"
}

variable "tags" {
  description = "Default tag for AWS provider"
  type        = map(string)
  default = {
    "Project"   = "terraform_homework"
    "Team"      = "DataEngineering_4.0"
    "Terraform" = "true"
    "Owner"     = "Igor Shubenko"
  }
}

variable "topics_amount" {
  description = "Amount of topics that will be created"
  type        = number
  default     = 0
}

variable "bootstrap_servers" {
  description = "URL's to initial servers you connect to when establishing connection to Kafka."
  type        = string
}