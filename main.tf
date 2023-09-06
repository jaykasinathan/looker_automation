provider "google" {
  credentials = file(var.google_config.credentials_file)
  project     = var.google_config.project_id
  region      = var.google_config.region
}