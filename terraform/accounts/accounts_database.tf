provider "elephantsql" {}

variable "database-name" {
  type = string
}


resource "elephantsql_instance" "lostcities_accounts_database" {
  name   = "lostcities_accounts"
  plan   = "tiny_turtle"
  region = "amazon-web-services::us-east-1"
}

output "psql_url" {
  value = elephantsql_instance.lostcities.url
}