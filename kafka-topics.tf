resource "kafka_topic" "messages" {
  for_each = toset([for i in range(var.topics_amount) : tostring(i)])

  name               = "messages-${each.value}"
  replication_factor = 1
  partitions         = random_integer.partitions_amount[each.value].result

  config = {
    "segment.ms"     = "20000"
    "cleanup.policy" = "compact"
  }
}


# Topics created on docker-compose up, imported to remote state
resource "kafka_topic" "events_taxonomy" {
  name               = "events.taxonomy"
  replication_factor = 1
  partitions         = 3

  config = {
    "segment.ms"     = "20000"
    "cleanup.policy" = "compact"
  }
}

resource "kafka_topic" "bets_state" {
  name               = "bets.state"
  replication_factor = 1
  partitions         = 3

  config = {
    "segment.ms"     = "20000"
    "cleanup.policy" = "compact"
  }
}
