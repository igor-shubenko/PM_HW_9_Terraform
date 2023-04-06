## Homework 9: Terraform

#### Description

Terraform module, that connects to Kafka running inside docker container and creates 10 topics with random amount
of partitions (from 1 to 6). Module uses AWS S3 remote state, that was configured during practice on lection.
To run Kafka I took a docker-compose file from my Kafka-project and removed unnecessary services. I left topic-init
service on
docker compose up to practice with importing them into remote state.

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                                      | Version          |
|---------------------------------------------------------------------------|------------------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1, >= 1.1.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws)                   | 4.50.0           |
| <a name="requirement_kafka"></a> [kafka](#requirement\_kafka)             | 0.5.2            |
| <a name="requirement_random"></a> [random](#requirement\_random)          | 3.4.3            |

## Providers

| Name                                                       | Version |
|------------------------------------------------------------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws)          | 4.50.0  |
| <a name="provider_kafka"></a> [kafka](#provider\_kafka)    | 0.5.2   |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3   |

## Modules

| Name                                                              | Source                              | Version |
|-------------------------------------------------------------------|-------------------------------------|---------|
| <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket) | terraform-aws-modules/s3-bucket/aws | 3.6.0   |

## Resources

| Name                                                                                                                      | Type     |
|---------------------------------------------------------------------------------------------------------------------------|----------|
| [aws_dynamodb_table.this](https://registry.terraform.io/providers/hashicorp/aws/4.50.0/docs/resources/dynamodb_table)     | resource |
| [kafka_topic.bets_state](https://registry.terraform.io/providers/Mongey/kafka/0.5.2/docs/resources/topic)                 | resource |
| [kafka_topic.events_taxonomy](https://registry.terraform.io/providers/Mongey/kafka/0.5.2/docs/resources/topic)            | resource |
| [kafka_topic.messages](https://registry.terraform.io/providers/Mongey/kafka/0.5.2/docs/resources/topic)                   | resource |
| [random_integer.partitions_amount](https://registry.terraform.io/providers/hashicorp/random/3.4.3/docs/resources/integer) | resource |

## Inputs

| Name                                                                                    | Description                                                                                                                               | Type          | Default                                                                                                                                             | Required |
|-----------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region)                      | AWS Region                                                                                                                                | `string`      | `"eu-central-1"`                                                                                                                                    |    no    |
| <a name="input_bootstrap_servers"></a> [bootstrap\_servers](#input\_bootstrap\_servers) | URL's to initial servers you connect to when establishing connection to Kafka.                                                            | `string`      | n/a                                                                                                                                                 |   yes    |
| <a name="input_delete_after"></a> [delete\_after](#input\_delete\_after)                | Last day of resource existing if is\_temporary == true. Format dd.mm.yyyy. If resource is not temporary, then default values is valid (-) | `string`      | `"-"`                                                                                                                                               |    no    |
| <a name="input_env"></a> [env](#input\_env)                                             | Environment                                                                                                                               | `string`      | n/a                                                                                                                                                 |   yes    |
| <a name="input_is_temporary"></a> [is\_temporary](#input\_is\_temporary)                | Set to true if this resource created temporary and should be removed after var.delete\_after                                              | `bool`        | `false`                                                                                                                                             |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                                          | Default tag for AWS provider                                                                                                              | `map(string)` | <pre>{<br>  "Owner": "Igor Shubenko",<br>  "Project": "terraform_homework",<br>  "Team": "DataEngineering_4.0",<br>  "Terraform": "true"<br>}</pre> |    no    |
| <a name="input_topics_amount"></a> [topics\_amount](#input\_topics\_amount)             | Amount of topics that will be created                                                                                                     | `number`      | `0`                                                                                                                                                 |    no    |

## Outputs

No outputs.
<!-- END_TF_DOCS -->