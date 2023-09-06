variable "google_config" {
  description = "Google Cloud Configuration"
  type = object({
    credentials_file = string
    project_id       = string
    region           = string
  })
}

variable "looker_instance_config" {
  description = "Looker Instance Configuration"
  type = object({
    name               = string
    platform_edition   = string
    public_ip_enabled  = bool
    allowed_email_domains = list(string)
  })
}

variable "maintenance_window_config" {
  description = "Maintenance Window Configuration"
  type = object({
    day_of_week = string
    start_time  = object({
      hours   = number
      minutes = number
      seconds = number
      nanos   = number
    })
  })
}

variable "oauth_config" {
  description = "OAuth Configuration"
  type = object({
    client_id     = string
    client_secret = string
  })
}