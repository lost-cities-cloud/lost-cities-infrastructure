resource "google_secret_manager_secret" "matches_database_url" {
  "matches_database_url_${var.env}" = "secret"
}

resource "google_secret_manager_secret" "matches_database_password" {
  "matches_database_password_${var.env}" = "secret"
}

