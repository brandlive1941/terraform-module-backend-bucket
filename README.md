# terraform-module-backend-bucket
terraform module for creating backend bucket for use in a gcp load balancer

Module Input Variables
----------------------

- `project` - gcp project id
- `name` - identifier for the service
- `location` - bucket location
- `cloud_run_services` - cloud run services to region map
- `enable_cdn` - enable/disable cdn
- `cdn_policy` - cdn policy
- `iap_config` - iap config
- `log_config` - log config

Usage
-----

```hcl
module "example-lb" {
  source          = "github.com/brandlive1941/terraform-module-backend-serverless?ref=v1.0.1"

  project_id = var.project_id
  name = each.value["name"]
  location = each.value["location"]
  service_name = each.value["service_name"]
  enable_cdn = each.value.backend["enable_cdn"]
  cdn_policy = each.value.backend["cdn_policy"]
  iap_config = each.value.backend["iap_config"]
  log_config = each.value.backend["log_config"]
}
```

Outputs
=======

Authors
=======

drew.mercer@brandlive.com