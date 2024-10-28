output "id" {
  description = "ID of the created backend bucket"
  value       = google_compute_backend_bucket.site.id
}

output "default_custom_error_response_policy" {
  description = "Default custom error response policy"
  value       = var.default_custom_error_response_policy
}