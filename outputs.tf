output "kinesisanalyticsv2_applications_id" {
  description = "Map of id values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.id if v.id != null && length(v.id) > 0 }
}
output "kinesisanalyticsv2_applications_application_configuration" {
  description = "Map of application_configuration values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => one(v.application_configuration) if v.application_configuration != null && length(v.application_configuration) > 0 }
}
output "kinesisanalyticsv2_applications_application_mode" {
  description = "Map of application_mode values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.application_mode if v.application_mode != null && length(v.application_mode) > 0 }
}
output "kinesisanalyticsv2_applications_arn" {
  description = "Map of arn values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "kinesisanalyticsv2_applications_cloudwatch_logging_options" {
  description = "Map of cloudwatch_logging_options values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => one(v.cloudwatch_logging_options) if v.cloudwatch_logging_options != null && length(v.cloudwatch_logging_options) > 0 }
}
output "kinesisanalyticsv2_applications_create_timestamp" {
  description = "Map of create_timestamp values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.create_timestamp if v.create_timestamp != null && length(v.create_timestamp) > 0 }
}
output "kinesisanalyticsv2_applications_description" {
  description = "Map of description values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.description if v.description != null && length(v.description) > 0 }
}
output "kinesisanalyticsv2_applications_force_stop" {
  description = "Map of force_stop values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.force_stop if v.force_stop != null }
}
output "kinesisanalyticsv2_applications_last_update_timestamp" {
  description = "Map of last_update_timestamp values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.last_update_timestamp if v.last_update_timestamp != null && length(v.last_update_timestamp) > 0 }
}
output "kinesisanalyticsv2_applications_name" {
  description = "Map of name values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.name if v.name != null && length(v.name) > 0 }
}
output "kinesisanalyticsv2_applications_region" {
  description = "Map of region values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.region if v.region != null && length(v.region) > 0 }
}
output "kinesisanalyticsv2_applications_runtime_environment" {
  description = "Map of runtime_environment values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.runtime_environment if v.runtime_environment != null && length(v.runtime_environment) > 0 }
}
output "kinesisanalyticsv2_applications_service_execution_role" {
  description = "Map of service_execution_role values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.service_execution_role if v.service_execution_role != null && length(v.service_execution_role) > 0 }
}
output "kinesisanalyticsv2_applications_start_application" {
  description = "Map of start_application values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.start_application if v.start_application != null }
}
output "kinesisanalyticsv2_applications_status" {
  description = "Map of status values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.status if v.status != null && length(v.status) > 0 }
}
output "kinesisanalyticsv2_applications_tags" {
  description = "Map of tags values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "kinesisanalyticsv2_applications_tags_all" {
  description = "Map of tags_all values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "kinesisanalyticsv2_applications_version_id" {
  description = "Map of version_id values across all kinesisanalyticsv2_applications, keyed the same as var.kinesisanalyticsv2_applications"
  value       = { for k, v in aws_kinesisanalyticsv2_application.kinesisanalyticsv2_applications : k => v.version_id if v.version_id != null }
}

