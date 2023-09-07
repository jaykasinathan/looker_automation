resource "google_looker_instance" "looker-instance" {
  name               = var.looker_instance_config.name
  platform_edition   = var.looker_instance_config.platform_edition
  region             = var.google_config.region
  public_ip_enabled  = var.looker_instance_config.public_ip_enabled
  admin_settings {
    allowed_email_domains = var.looker_instance_config.allowed_email_domains
  }
  maintenance_window {
    day_of_week = var.maintenance_window_config.day_of_week
    start_time {
      hours   = var.maintenance_window_config.start_time.hours
      minutes = var.maintenance_window_config.start_time.minutes
      seconds = var.maintenance_window_config.start_time.seconds
      nanos   = var.maintenance_window_config.start_time.nanos
    }
  }
  oauth_config {
    client_id     = var.oauth_config.client_id
    client_secret = var.oauth_config.client_secret
  }
}
# provisioner "local-exec" {
#   command = "python3 looker_automation.py"
#   environment = {
#     LOOKER_CLIENT_ID     = "your_client_id"
#     LOOKER_CLIENT_SECRET = "your_client_secret"
#     LOOKER_INSTANCE_NAME = looker_instance_name 
#   }
# }