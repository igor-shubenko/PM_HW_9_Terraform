terraform {
  required_version = "~> 1.1, >= 1.1.2"

  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.50.0"
    }

    kafka = {
      source  = "Mongey/kafka"
      version = "0.5.2"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }

  }

}
