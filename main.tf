locals {
  backend = {
    enable_cdn = var.enable_cdn
    cdn_policy = var.cdn_policy
    log_config = var.log_config
    groups = [
      {
        group = google_compute_backend_bucket.site.self_link
      }
    ]
    iap_config = var.iap_config
  }
}

# Bucket to store site
resource "google_storage_bucket" "site" {
  name                        = var.name
  project                     = var.project_id
  location                    = var.location
  uniform_bucket_level_access = var.uniform_bucket_level_access
  force_destroy               = true
  dynamic "website" {
    for_each = var.website ? [1] : []
    content {
      main_page_suffix = "index.html"
      not_found_page   = "index.html"
    }
  }
  dynamic "cors" {
    for_each = var.cors_policy
    content {
      origin          = var.cors_policy.origin
      method          = var.cors_policy.method
      response_header = var.cors_policy.response_header
      max_age_seconds = var.cors_policy.max_age_seconds
    }
  }
}

# Public access to bucket
resource "google_storage_bucket_iam_member" "site" {
  bucket = google_storage_bucket.site.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

# Add the bucket as a CDN backend
resource "google_compute_backend_bucket" "site" {
  name        = var.service_name
  project     = var.project_id
  description = "Backend service for ${var.name}"
  bucket_name = google_storage_bucket.site.name
  enable_cdn  = true
}
