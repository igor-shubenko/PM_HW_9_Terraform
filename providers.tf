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