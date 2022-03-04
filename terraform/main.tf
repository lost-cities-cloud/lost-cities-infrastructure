
terraform {
  cloud {
    organization = "lostcities"

    workspaces {
      name = "testing"
    }
  }
}

