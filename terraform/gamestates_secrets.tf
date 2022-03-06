resource "google_secret_manager_secret" "gamestates_store_url" {
  "gamestates_store_url_${var.env}" = "secret"
}

resource "google_secret_manager_secret" "gamestates_store_password" {
  "gamestates_store_password_${var.env}" = "secret"
}

