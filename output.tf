output "name" {
  description = "ID of the created bucket"
  value       = google_compute_backend_bucket.site.self_link
}

output "backend" {
  description = "Backend Details"
  value       = local.backend
}
