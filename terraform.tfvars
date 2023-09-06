google_config = {
  credentials_file = "path/to/credentials.json"
  project_id       = "river-dynamo-396718"
  region           = "us-central1"
}

looker_instance_config = {
  name               = "jay-looker-demo"
  platform_edition   = "LOOKER_CORE_TRIAL"
  public_ip_enabled  = true
  allowed_email_domains = ["google.com"]
}

maintenance_window_config = {
  day_of_week = "THURSDAY"
  start_time  = {
    hours   = 22
    minutes = 0
    seconds = 0
    nanos   = 0
  }
}

oauth_config = {
  client_id     = "755402981465-tvj1m2ke7hrj3q54qu3ed28an6rcg1p8.apps.googleusercontent.com"
  client_secret = "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"
}