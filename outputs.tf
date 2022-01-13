output "subscription_path" {
  value       = google_pubsub_subscription.subscription.id
  description = "Path of the Subscription"
}

output "subscription_name" {
  value       = google_pubsub_subscription.subscription.name
  description = "Name of the Subscription"
}
