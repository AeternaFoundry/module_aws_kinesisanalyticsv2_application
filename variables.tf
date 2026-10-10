variable "kinesisanalyticsv2_applications" {
  description = <<EOT
Map of kinesisanalyticsv2_applications, attributes below
Required:
    - name
    - runtime_environment
    - service_execution_role
Optional:
    - application_mode
    - description
    - force_stop
    - region
    - start_application
    - tags
    - tags_all
    - application_configuration (block):
        - application_code_configuration (required, block):
            - code_content (optional, block):
                - s3_content_location (optional, block):
                    - bucket_arn (required)
                    - file_key (required)
                    - object_version (optional)
                - text_content (optional)
            - code_content_type (required)
        - application_encryption_configuration (optional, block):
            - key_id (optional)
            - key_type (required)
        - application_snapshot_configuration (optional, block):
            - snapshots_enabled (required)
        - environment_properties (optional, block):
            - property_group (required, block):
                - property_group_id (required)
                - property_map (required)
        - flink_application_configuration (optional, block):
            - checkpoint_configuration (optional, block):
                - checkpoint_interval (optional)
                - checkpointing_enabled (optional)
                - configuration_type (required)
                - min_pause_between_checkpoints (optional)
            - monitoring_configuration (optional, block):
                - configuration_type (required)
                - log_level (optional)
                - metrics_level (optional)
            - parallelism_configuration (optional, block):
                - auto_scaling_enabled (optional)
                - configuration_type (required)
                - parallelism (optional)
                - parallelism_per_kpu (optional)
        - run_configuration (optional, block):
            - application_restore_configuration (optional, block):
                - application_restore_type (optional)
                - snapshot_name (optional)
            - flink_run_configuration (optional, block):
                - allow_non_restored_state (optional)
        - sql_application_configuration (optional, block):
            - input (optional, block):
                - input_parallelism (optional, block):
                    - count (optional)
                - input_processing_configuration (optional, block):
                    - input_lambda_processor (required, block):
                        - resource_arn (required)
                - input_schema (required, block):
                    - record_column (required, block):
                        - mapping (optional)
                        - name (required)
                        - sql_type (required)
                    - record_encoding (optional)
                    - record_format (required, block):
                        - mapping_parameters (required, block):
                            - csv_mapping_parameters (optional, block):
                                - record_column_delimiter (required)
                                - record_row_delimiter (required)
                            - json_mapping_parameters (optional, block):
                                - record_row_path (required)
                        - record_format_type (required)
                - input_starting_position_configuration (optional, block):
                    - input_starting_position (optional)
                - kinesis_firehose_input (optional, block):
                    - resource_arn (required)
                - kinesis_streams_input (optional, block):
                    - resource_arn (required)
                - name_prefix (required)
            - output (optional, block):
                - destination_schema (required, block):
                    - record_format_type (required)
                - kinesis_firehose_output (optional, block):
                    - resource_arn (required)
                - kinesis_streams_output (optional, block):
                    - resource_arn (required)
                - lambda_output (optional, block):
                    - resource_arn (required)
                - name (required)
            - reference_data_source (optional, block):
                - reference_schema (required, block):
                    - record_column (required, block):
                        - mapping (optional)
                        - name (required)
                        - sql_type (required)
                    - record_encoding (optional)
                    - record_format (required, block):
                        - mapping_parameters (required, block):
                            - csv_mapping_parameters (optional, block):
                                - record_column_delimiter (required)
                                - record_row_delimiter (required)
                            - json_mapping_parameters (optional, block):
                                - record_row_path (required)
                        - record_format_type (required)
                - s3_reference_data_source (required, block):
                    - bucket_arn (required)
                    - file_key (required)
                - table_name (required)
        - vpc_configuration (optional, block):
            - security_group_ids (required)
            - subnet_ids (required)
    - cloudwatch_logging_options (block):
        - log_stream_arn (required)
EOT

  type = map(object({
    name                   = string
    runtime_environment    = string
    service_execution_role = string
    application_mode       = optional(string)
    description            = optional(string)
    force_stop             = optional(bool)
    region                 = optional(string)
    start_application      = optional(bool)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    application_configuration = optional(object({
      application_code_configuration = object({
        code_content = optional(object({
          s3_content_location = optional(object({
            bucket_arn     = string
            file_key       = string
            object_version = optional(string)
          }))
          text_content = optional(string)
        }))
        code_content_type = string
      })
      application_encryption_configuration = optional(object({
        key_id   = optional(string)
        key_type = string
      }))
      application_snapshot_configuration = optional(object({
        snapshots_enabled = bool
      }))
      environment_properties = optional(object({
        property_group = list(object({
          property_group_id = string
          property_map      = map(string)
        }))
      }))
      flink_application_configuration = optional(object({
        checkpoint_configuration = optional(object({
          checkpoint_interval           = optional(number)
          checkpointing_enabled         = optional(bool)
          configuration_type            = string
          min_pause_between_checkpoints = optional(number)
        }))
        monitoring_configuration = optional(object({
          configuration_type = string
          log_level          = optional(string)
          metrics_level      = optional(string)
        }))
        parallelism_configuration = optional(object({
          auto_scaling_enabled = optional(bool)
          configuration_type   = string
          parallelism          = optional(number)
          parallelism_per_kpu  = optional(number)
        }))
      }))
      run_configuration = optional(object({
        application_restore_configuration = optional(object({
          application_restore_type = optional(string)
          snapshot_name            = optional(string)
        }))
        flink_run_configuration = optional(object({
          allow_non_restored_state = optional(bool)
        }))
      }))
      sql_application_configuration = optional(object({
        input = optional(object({
          input_parallelism = optional(object({
            count = optional(number)
          }))
          input_processing_configuration = optional(object({
            input_lambda_processor = object({
              resource_arn = string
            })
          }))
          input_schema = object({
            record_column = list(object({
              mapping  = optional(string)
              name     = string
              sql_type = string
            }))
            record_encoding = optional(string)
            record_format = object({
              mapping_parameters = object({
                csv_mapping_parameters = optional(object({
                  record_column_delimiter = string
                  record_row_delimiter    = string
                }))
                json_mapping_parameters = optional(object({
                  record_row_path = string
                }))
              })
              record_format_type = string
            })
          })
          input_starting_position_configuration = optional(list(object({
            input_starting_position = optional(string)
          })))
          kinesis_firehose_input = optional(object({
            resource_arn = string
          }))
          kinesis_streams_input = optional(object({
            resource_arn = string
          }))
          name_prefix = string
        }))
        output = optional(list(object({
          destination_schema = object({
            record_format_type = string
          })
          kinesis_firehose_output = optional(object({
            resource_arn = string
          }))
          kinesis_streams_output = optional(object({
            resource_arn = string
          }))
          lambda_output = optional(object({
            resource_arn = string
          }))
          name = string
        })))
        reference_data_source = optional(object({
          reference_schema = object({
            record_column = list(object({
              mapping  = optional(string)
              name     = string
              sql_type = string
            }))
            record_encoding = optional(string)
            record_format = object({
              mapping_parameters = object({
                csv_mapping_parameters = optional(object({
                  record_column_delimiter = string
                  record_row_delimiter    = string
                }))
                json_mapping_parameters = optional(object({
                  record_row_path = string
                }))
              })
              record_format_type = string
            })
          })
          s3_reference_data_source = object({
            bucket_arn = string
            file_key   = string
          })
          table_name = string
        }))
      }))
      vpc_configuration = optional(object({
        security_group_ids = set(string)
        subnet_ids         = set(string)
      }))
    }))
    cloudwatch_logging_options = optional(object({
      log_stream_arn = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.kinesisanalyticsv2_applications : (
        v.application_configuration == null || (v.application_configuration.environment_properties == null || (length(v.application_configuration.environment_properties.property_group) >= 1 && length(v.application_configuration.environment_properties.property_group) <= 50))
      )
    ])
    error_message = "Each property_group list must contain between 1 and 50 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesisanalyticsv2_applications : (
        v.application_configuration == null || (v.application_configuration.sql_application_configuration == null || (v.application_configuration.sql_application_configuration.input == null || (length(v.application_configuration.sql_application_configuration.input.input_schema.record_column) >= 1 && length(v.application_configuration.sql_application_configuration.input.input_schema.record_column) <= 1000)))
      )
    ])
    error_message = "Each record_column list must contain between 1 and 1000 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesisanalyticsv2_applications : (
        v.application_configuration == null || (v.application_configuration.sql_application_configuration == null || (v.application_configuration.sql_application_configuration.output == null || (length(v.application_configuration.sql_application_configuration.output) <= 3)))
      )
    ])
    error_message = "Each output list must contain at most 3 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesisanalyticsv2_applications : (
        v.application_configuration == null || (v.application_configuration.sql_application_configuration == null || (v.application_configuration.sql_application_configuration.reference_data_source == null || (length(v.application_configuration.sql_application_configuration.reference_data_source.reference_schema.record_column) >= 1 && length(v.application_configuration.sql_application_configuration.reference_data_source.reference_schema.record_column) <= 1000)))
      )
    ])
    error_message = "Each record_column list must contain between 1 and 1000 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesisanalyticsv2_applications : (
        v.application_configuration == null || (v.application_configuration.application_code_configuration.code_content == null || (v.application_configuration.application_code_configuration.code_content.s3_content_location == null || (length(v.application_configuration.application_code_configuration.code_content.s3_content_location.file_key) >= 1 && length(v.application_configuration.application_code_configuration.code_content.s3_content_location.file_key) <= 1024)))
      )
    ])
    error_message = "must be between 1 and 1024 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesisanalyticsv2_applications : (
        v.application_configuration == null || (v.application_configuration.application_code_configuration.code_content == null || (v.application_configuration.application_code_configuration.code_content.text_content == null || (length(v.application_configuration.application_code_configuration.code_content.text_content) >= 0 && length(v.application_configuration.application_code_configuration.code_content.text_content) <= 102400)))
      )
    ])
    error_message = "must be between 0 and 102400 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesisanalyticsv2_applications : (
        v.application_configuration == null || (v.application_configuration.environment_properties == null || (alltrue([for item in v.application_configuration.environment_properties.property_group : ((length(item.property_group_id) >= 1 && length(item.property_group_id) <= 50) && (can(regex("^[0-9A-Za-z_.-]+$", item.property_group_id))))])))
      )
    ])
    error_message = "all of: must be between 1 and 50 characters; must only include alphanumeric, underscore, period, or hyphen characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesisanalyticsv2_applications : (
        v.application_configuration == null || (v.application_configuration.flink_application_configuration == null || (v.application_configuration.flink_application_configuration.checkpoint_configuration == null || (v.application_configuration.flink_application_configuration.checkpoint_configuration.checkpoint_interval == null || (v.application_configuration.flink_application_configuration.checkpoint_configuration.checkpoint_interval >= 1))))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesisanalyticsv2_applications : (
        v.application_configuration == null || (v.application_configuration.flink_application_configuration == null || (v.application_configuration.flink_application_configuration.checkpoint_configuration == null || (v.application_configuration.flink_application_configuration.checkpoint_configuration.min_pause_between_checkpoints == null || (v.application_configuration.flink_application_configuration.checkpoint_configuration.min_pause_between_checkpoints >= 0))))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesisanalyticsv2_applications : (
        v.application_configuration == null || (v.application_configuration.flink_application_configuration == null || (v.application_configuration.flink_application_configuration.parallelism_configuration == null || (v.application_configuration.flink_application_configuration.parallelism_configuration.parallelism == null || (v.application_configuration.flink_application_configuration.parallelism_configuration.parallelism >= 1))))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesisanalyticsv2_applications : (
        v.application_configuration == null || (v.application_configuration.flink_application_configuration == null || (v.application_configuration.flink_application_configuration.parallelism_configuration == null || (v.application_configuration.flink_application_configuration.parallelism_configuration.parallelism_per_kpu == null || (v.application_configuration.flink_application_configuration.parallelism_configuration.parallelism_per_kpu >= 1))))
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.kinesisanalyticsv2_applications : (
        v.application_configuration == null || (v.application_configuration.sql_application_configuration == null || (v.application_configuration.sql_application_configuration.input == null || (v.application_configuration.sql_application_configuration.input.input_parallelism == null || (v.application_configuration.sql_application_configuration.input.input_parallelism.count == null || (v.application_configuration.sql_application_configuration.input.input_parallelism.count >= 1 && v.application_configuration.sql_application_configuration.input.input_parallelism.count <= 64)))))
      )
    ])
    error_message = "must be between 1 and 64"
  }
  # Note: 32 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

