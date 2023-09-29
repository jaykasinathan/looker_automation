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

resource "null_resource" "run_python_script" {
  depends_on = [google_looker_instance.looker-instance]

  triggers = {
    looker_instance_url = google_looker_instance.looker-instance.looker_uri
  }

  provisioner "local-exec" {
    environment = {
      LOOKER_URL = google_looker_instance.looker-instance.looker_uri
      CLIENT_ID = var.oauth_config.client_id
      CLIENT_SECRET = var.oauth_config.client_secret
    }
    command = "python3 looker_automation.py"
  }
}