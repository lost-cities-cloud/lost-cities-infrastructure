resource "google_secret_manager_secret" "events_store_url" {
  "events_store_url_${var.env}" = "secret"
}

resource "google_secret_manager_secret" "events_store_password" {
  "events_store_password_${var.env}" = "secret"
}


