provider "aws" {
  region = var.aws_region

  default_tags {
    tags = merge(var.tags, {
      Env         = var.env
      Temporary   = var.is_temporary
      DeleteAfter = var.delete_after
    })
  }
}

provider "kafka" {
  bootstrap_servers = [var.bootstrap_servers]
  ca_cert           = ""
  client_cert       = ""
  client_key        = ""
  tls_enabled       = false
}

provider "random" {}