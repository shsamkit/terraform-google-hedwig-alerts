output "high_message_count_alert_path" {
  value       = "${google_monitoring_alert_policy.high_message_alert.name}"
  description = "Path of the high message count alert"
}

output "dlq_alert_path" {
  value       = "${join("", google_monitoring_alert_policy.dlq_alert.*.name)}"
  description = "Path of the DLQ alert"
}
