variable "project_id" {
  description = "GCP Project Id"
  type        = string
}

variable "name" {
  description = "Bucket name"
  type        = string
}

variable "location" {
  description = "Bucket location"
  type        = string
  default     = "us"
}

variable "service_name" {
  description = "Backend Service name"
  type        = string
}

variable "website" {
  description = "Toggles static website hosting on"
  type        = bool
  default     = false
}

variable "bucket_location" {
  description = "local to a region, global, and replication"
  type        = string
  default     = "us"
}

variable "uniform_bucket_level_access" {
  description = "Toggles uniform bucket level access on"
  type        = bool
  default     = false
}

variable "cors_enabled" {
  description = "Toggles CORS on"
  type        = bool
  default     = false
}

variable "cors_origins" {
  description = "CORS origins"
  type        = list(string)
  default     = ["*"]
}

variable "cors_methods" {
  description = "CORS methods"
  type        = list(string)
  default     = ["GET", "HEAD"]
}

variable "cors_response_headers" {
  description = "CORS response headers"
  type        = list(string)
  default     = ["*"]
}

variable "cors_max_age_seconds" {
  description = "CORS max age seconds"
  type        = number
  default     = 3600
}

variable "enable_cdn" {
  description = "Enable CDN for the backend"
  type        = bool
  default     = false
}

variable "cdn_policy" {
  description = "CDN Policy"
  type = object({
    cache_mode                   = optional(string)
    signed_url_cache_max_age_sec = optional(string)
    client_ttl                   = optional(number)
    default_ttl                  = optional(number)
    max_ttl                      = optional(number)
    min_ttl                      = optional(number)
  })
  default = {
    cache_mode  = null
    client_ttl  = null
    default_ttl = null
    max_ttl     = null
    min_ttl     = null
  }
}

variable "log_config" {
  description = "Log Configuration"
  type = object({
    enable      = optional(bool)
    sample_rate = optional(number)
  })
  default = {
    enable      = null
    sample_rate = null
  }
}

variable "iap_config" {
  description = "IAP Configuration"
  type = object({
    enable               = bool
    oauth2_client_id     = optional(string)
    oauth2_client_secret = optional(string)
  })
  default = {
    enable               = false
    oauth2_client_id     = null
    oauth2_client_secret = null
  }
}