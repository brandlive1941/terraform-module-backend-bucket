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

variable "uniform_bucket_level_access" {
  description = "Toggles uniform bucket level access on"
  type        = bool
  default     = true
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

variable "default_custom_error_response_policy" {
  description = "Default custom error response policy"
  type = object({
    custom_error_responses = optional(list(object({
      match_response_codes   = optional(string)
      path                   = optional(string)
      override_response_code = optional(string)
    })))
    error_service = optional(string)
  })
  default = {
    custom_error_responses = null
    error_service          = null
  }
}

variable "cors_policy" {
  description = "Set of maps of mixed type attributes for CORS values"
  type        = set(any)
  default     = []
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