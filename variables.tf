variable "queue" {
  description = "Subscription queue (e.g. dev-myapp); unique across your infra"
}

variable "topic" {
  description = "Name of the Cloud Pub/Sub Topic"
}

variable "labels" {
  description = "Labels to attach to the subscription"
  type        = map(string)
}

variable "iam_service_account" {
  description = "The IAM service account to create exclusive IAM permissions for the subscription"
  default     = ""
}

variable "enable_message_ordering" {
  description = "Order messages by orderingKey or publish time"
  default     = false
}

variable "disable_dlq" {
  description = "Don't configure dlq policy. This is useful for firehose subscription using dataflow."
  default     = false
}
