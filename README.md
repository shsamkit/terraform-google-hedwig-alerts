Hedwig Alerts Terraform module
==============================

[Hedwig](https://github.com/Automatic/hedwig) is a inter-service communication bus that works on Google Pub/Sub, while keeping things pretty simple and
straight forward. It uses [json schema](http://json-schema.org/) draft v4 for schema validation so all incoming
and outgoing messages are validated against pre-defined schema.

This module provides a custom [Terraform](https://www.terraform.io/) modules for deploying Hedwig infrastructure that
creates infra for monitoring a Hedwig consumer app.

## Usage

```hcl
module "topic-dev-user-updated-v1" {
  source = "standard-ai/hedwig-topic/google"
  topic  = "dev-user-updated-v1"
}

module "sub-dev-myapp-dev-user-updated" {
  source = "standard-ai/hedwig-subscription/google"
  topic  = "${module.topic-dev-user-updated-v1.name}"
  name   = "dev-myapp"
}

module "alerts-dev-myapp-dev-user-updated" {
  source       = "standard-ai/hedwig-alerts/google"
  subscription = "${module.sub-dev-myapp-dev-user-updated.subscription_name}"
}
```

If using a single Google project for multiple environments (e.g. dev/staging/prod), ensure that `name` includes your 
environment name.

Please note Google's restrictions (if not followed, errors may be confusing and often totally wrong):
- [Labels](https://cloud.google.com/pubsub/docs/labels#requirements)
- [Resource names](https://cloud.google.com/pubsub/docs/admin#resource_names) 

## Release Notes

[Github Releases](https://github.com/standard-ai/terraform-google-hedwig-alerts/releases)

## How to publish

Go to [Terraform Registry](https://registry.terraform.io/modules/standard-ai/hedwig-alerts/google), and 
Resync module.
