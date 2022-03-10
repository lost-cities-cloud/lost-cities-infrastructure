terraform {
  required_providers {
    upstash = {
      source = "upstash/upstash"
      version = "x.x.x"
    }
  }
}

provider "upstash" {
  email = var.email
  api_key  = var.api_key
}

resource "upstash_redis_database" "redis" {
  database_name = "gamestate"
  region = "us-east-1"
  tls = "true"
  multi_zone = "false"
}

