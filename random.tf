resource "random_integer" "partitions_amount" {
  count = var.topics_amount
  min   = 1
  max   = 6
}
