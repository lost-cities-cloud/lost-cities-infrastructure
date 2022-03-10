provider "elephantsql" {}

variable "database-name" {
  type = string
}


resource "elephantsql_instance" "lostcities" {
  name   = var.database_name
  plan   = "tiny_turtle"
  region = "amazon-web-services::us-east-1"
}



resource "google_secret_manager_secret_iam_member" "my-app" {
  provider = google-beta

  secret_id = google_secret_manager_secret.my-secret.id
  role      = "roles/secretmanager.secretAccessor"
  member    = "user:foo@bar.com" # or serviceAccount:my-app@...
}

output "psql_url" {
  value = elephantsql_instance.lostcities.url
}