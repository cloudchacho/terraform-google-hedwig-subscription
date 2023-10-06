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

variable "filter" {
  description = ") The subscription only delivers the messages that match the filter. Pub/Sub automatically acknowledges the messages that don't match the filter. You can filter messages by their attributes. The maximum length of a filter is 256 bytes. After creating the subscription, you can't modify the filter."
  default     = ""
  nullable    = false
}

variable "max_delivery_attempts" {
  description = "The maximum number of delivery attempts for any message. The value must be between 5 and 100. The number of delivery attempts is defined as 1 + (the sum of number of NACKs and number of times the acknowledgement deadline has been exceeded for the message). A NACK is any call to ModifyAckDeadline with a 0 deadline. Note that client libraries may automatically extend ack_deadlines. This field will be honored on a best effort basis."
  default     = 5
  nullable    = false
}

variable "retry_policy" {
  description = "A policy that specifies how Pub/Sub retries message delivery for this subscription. If not set, the default retry policy is applied. This generally implies that messages will be retried as soon as possible for healthy subscribers. RetryPolicy will be triggered on NACKs or acknowledgement deadline exceeded events for a given message"
  type = object({
    minimum_backoff = string
    maximum_backoff = string
  })
  default = null
}

variable "retain_acked_messages" {
  description = "Indicates whether to retain acknowledged messages. If true, then messages are not expunged from the subscription's backlog, even if they are acknowledged, until they fall out of the messageRetentionDuration window."
  default     = false
}
