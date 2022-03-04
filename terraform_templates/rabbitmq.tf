provider "cloudamqp" {
  apikey        = var.cloudamqp_customer_api_key
}

# Create a new cloudamqp instance
resource "cloudamqp_instance" "lostcities" {
  name          = "lostcities-events"
  plan          = "lemur"
  region        = "amazon-web-services::us-east-1"
  nodes         = 1
  tags          = [ "terraform" ]
  rmq_version   = "3.8.3"
}