resource "google_secret_manager_secret" "accounts_database_url" {
  "accounts_database_url_${var.env}" = "secret"
}

resource "google_secret_manager_secret" "accounts_database_password" {
  "accounts_database_password_${var.env}" = "secret"
}

resource "google_secret_manager_secret" "accounts_jwt_secret" {
  "accounts_jwt_secret_${var.env}" = "secret"
}


