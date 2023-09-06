resource "google_looker_instance" "looker-instance" {
  name               = "jay-looker-demo"
  platform_edition   = "LOOKER_CORE_TRIAL"
  region             = "us-central1"
  public_ip_enabled  = true
#   admin_settings {
#     allowed_email_domains = ["google.com"]
#   }
  maintenance_window {
    day_of_week = "THURSDAY"
    start_time {
      hours   = 22
      minutes = 0
      seconds = 0
      nanos   = 0
    }
  }
  oauth_config {
    client_id = "755402981465-tvj1m2ke7hrj3q54qu3ed28an6rcg1p8.apps.googleusercontent.com"
    client_secret = "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"
  }
}

# provisioner "local-exec" {
#   command = "python3 looker_automation.py"
#   environment = {
#     LOOKER_CLIENT_ID     = "your_client_id"
#     LOOKER_CLIENT_SECRET = "your_client_secret"
#   }
# }