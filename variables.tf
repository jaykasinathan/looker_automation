variable "project_id" {
  description = "Google Cloud Project ID"
}

variable "region" {
  description = "Google Cloud region"
  default     = "us-central1"
}

variable "instance_name" {
  description = "Name of the Looker instance"
  default     = "my-instance"
}

variable "platform_edition" {
  description = "Platform edition for Looker"
  default     = "LOOKER_CORE_TRIAL"
}

variable "public_ip_enabled" {
  description = "Enable public IP"
  default     = true
}

variable "allowed_email_domains" {
  description = "Allowed email domains for admin settings"
  default     = ["google.com"]
}

variable "maintenance_day_of_week" {
  description = "Day of the week for maintenance"
  default     = "THURSDAY"
}

variable "maintenance_start_time_hours" {
  description = "Maintenance start time in hours"
  default     = 22
}

variable "maintenance_start_time_minutes" {
  description = "Maintenance start time in minutes"
  default     = 0
}

variable "maintenance_start_time_seconds" {
  description = "Maintenance start time in seconds"
  default     = 0
}

variable "maintenance_start_time_nanos" {
  description = "Maintenance start time in nanoseconds"
  default     = 0
}

variable "oauth_client_id" {
  description = "OAuth Client ID"
}

variable "oauth_client_secret" {
  description = "OAuth Client Secret"
}