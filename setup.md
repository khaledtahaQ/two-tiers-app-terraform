# Setup Instructions

## requirements: 
* terraform installed (<= v1.5.7)
* aws cli installed
* aws access key & aws secret key

## setup steps
* run `aws configure` and add your access key and secret key
* clone the repository
* run `terraform init` to initialize working directory containing configuration files and installs plugins for required providers.
* run `terraform plan` to check the output of the plan for the config files
* run `terraform apply` to apply the resources on the cloud, it will ask for input that will be used as database password



## terraform plan output 

```angular2html
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_autoscaling_attachment.asg_attachment will be created
  + resource "aws_autoscaling_attachment" "asg_attachment" {
      + autoscaling_group_name = (known after apply)
      + id                     = (known after apply)
      + lb_target_group_arn    = (known after apply)
    }

  # aws_autoscaling_group.web_app will be created
  + resource "aws_autoscaling_group" "web_app" {
      + arn                              = (known after apply)
      + availability_zones               = (known after apply)
      + default_cooldown                 = (known after apply)
      + desired_capacity                 = 2
      + force_delete                     = false
      + force_delete_warm_pool           = false
      + health_check_grace_period        = 300
      + health_check_type                = (known after apply)
      + id                               = (known after apply)
      + ignore_failed_scaling_activities = false
      + load_balancers                   = (known after apply)
      + max_size                         = 5
      + metrics_granularity              = "1Minute"
      + min_size                         = 2
      + name                             = (known after apply)
      + name_prefix                      = (known after apply)
      + predicted_capacity               = (known after apply)
      + protect_from_scale_in            = false
      + service_linked_role_arn          = (known after apply)
      + target_group_arns                = (known after apply)
      + vpc_zone_identifier              = (known after apply)
      + wait_for_capacity_timeout        = "10m"
      + warm_pool_size                   = (known after apply)

      + launch_template {
          + id      = (known after apply)
          + name    = (known after apply)
          + version = "$Latest"
        }
    }

  # aws_cloudwatch_log_group.error will be created
  + resource "aws_cloudwatch_log_group" "error" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + log_group_class   = (known after apply)
      + name              = "/aws/rds/instance/db/error"
      + name_prefix       = (known after apply)
      + retention_in_days = 5
      + skip_destroy      = false
      + tags_all          = (known after apply)
    }

  # aws_cloudwatch_log_group.web_app_log_group will be created
  + resource "aws_cloudwatch_log_group" "web_app_log_group" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + log_group_class   = (known after apply)
      + name              = "/aws/web-app-logs"
      + name_prefix       = (known after apply)
      + retention_in_days = 7
      + skip_destroy      = false
      + tags_all          = (known after apply)
    }

  # aws_cloudwatch_metric_alarm.alb_4xx_errors will be created
  + resource "aws_cloudwatch_metric_alarm" "alb_4xx_errors" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "the alarm will be triggered if the number of 4xx errors exceeds 100 in 5 minutes"
      + alarm_name                            = "alb-4xx-errors"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + dimensions                            = (known after apply)
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 1
      + id                                    = (known after apply)
      + metric_name                           = "HTTPCode_ELB_4XX_Count"
      + namespace                             = "AWS/ApplicationELB"
      + period                                = 300
      + statistic                             = "Sum"
      + tags_all                              = (known after apply)
      + threshold                             = 100
      + treat_missing_data                    = "missing"
    }

  # aws_cloudwatch_metric_alarm.alb_5xx_errors will be created
  + resource "aws_cloudwatch_metric_alarm" "alb_5xx_errors" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "the alarm will be triggered if the number of 4xx errors exceeds 10 in 5 minutes"
      + alarm_name                            = "alb-5xx-errors"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + dimensions                            = (known after apply)
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 1
      + id                                    = (known after apply)
      + metric_name                           = "HTTPCode_ELB_5XX_Count"
      + namespace                             = "AWS/ApplicationELB"
      + period                                = 300
      + statistic                             = "Sum"
      + tags_all                              = (known after apply)
      + threshold                             = 10
      + treat_missing_data                    = "missing"
    }

  # aws_cloudwatch_metric_alarm.alb_high_response_time will be created
  + resource "aws_cloudwatch_metric_alarm" "alb_high_response_time" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "the alarm will be triggered if the target response time exceeds 2 seconds"
      + alarm_name                            = "alb-high-response-time"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + dimensions                            = (known after apply)
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 1
      + id                                    = (known after apply)
      + metric_name                           = "TargetResponseTime"
      + namespace                             = "AWS/ApplicationELB"
      + period                                = 300
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 2
      + treat_missing_data                    = "missing"
    }

  # aws_cloudwatch_metric_alarm.alb_unhealthy_host will be created
  + resource "aws_cloudwatch_metric_alarm" "alb_unhealthy_host" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "the alarm will be triggered if there is at least one unhealthy host"
      + alarm_name                            = "alb-unhealthy-hosts"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + dimensions                            = (known after apply)
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 1
      + id                                    = (known after apply)
      + metric_name                           = "UnHealthyHostCount"
      + namespace                             = "AWS/ApplicationELB"
      + period                                = 300
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 1
      + treat_missing_data                    = "missing"
    }

  # aws_db_instance.db will be created
  + resource "aws_db_instance" "db" {
      + address                               = (known after apply)
      + allocated_storage                     = 20
      + apply_immediately                     = false
      + arn                                   = (known after apply)
      + auto_minor_version_upgrade            = true
      + availability_zone                     = (known after apply)
      + backup_retention_period               = (known after apply)
      + backup_target                         = (known after apply)
      + backup_window                         = (known after apply)
      + ca_cert_identifier                    = (known after apply)
      + character_set_name                    = (known after apply)
      + copy_tags_to_snapshot                 = false
      + db_name                               = (known after apply)
      + db_subnet_group_name                  = "db-subnet-group"
      + dedicated_log_volume                  = false
      + delete_automated_backups              = true
      + domain_fqdn                           = (known after apply)
      + enabled_cloudwatch_logs_exports       = [
          + "postgresql",
        ]
      + endpoint                              = (known after apply)
      + engine                                = "postgres"
      + engine_lifecycle_support              = (known after apply)
      + engine_version                        = "16.4"
      + engine_version_actual                 = (known after apply)
      + hosted_zone_id                        = (known after apply)
      + id                                    = (known after apply)
      + identifier                            = "db"
      + identifier_prefix                     = (known after apply)
      + instance_class                        = "db.t3.micro"
      + iops                                  = (known after apply)
      + kms_key_id                            = (known after apply)
      + latest_restorable_time                = (known after apply)
      + license_model                         = (known after apply)
      + listener_endpoint                     = (known after apply)
      + maintenance_window                    = (known after apply)
      + master_user_secret                    = (known after apply)
      + master_user_secret_kms_key_id         = (known after apply)
      + monitoring_interval                   = 0
      + monitoring_role_arn                   = (known after apply)
      + multi_az                              = (known after apply)
      + nchar_character_set_name              = (known after apply)
      + network_type                          = (known after apply)
      + option_group_name                     = (known after apply)
      + parameter_group_name                  = (known after apply)
      + password                              = (sensitive value)
      + performance_insights_enabled          = false
      + performance_insights_kms_key_id       = (known after apply)
      + performance_insights_retention_period = (known after apply)
      + port                                  = (known after apply)
      + publicly_accessible                   = false
      + replica_mode                          = (known after apply)
      + replicas                              = (known after apply)
      + resource_id                           = (known after apply)
      + skip_final_snapshot                   = true
      + snapshot_identifier                   = (known after apply)
      + status                                = (known after apply)
      + storage_throughput                    = (known after apply)
      + storage_type                          = (known after apply)
      + tags_all                              = (known after apply)
      + timezone                              = (known after apply)
      + username                              = "ahl"
      + vpc_security_group_ids                = (known after apply)
    }

  # aws_db_subnet_group.db_subnet will be created
  + resource "aws_db_subnet_group" "db_subnet" {
      + arn                     = (known after apply)
      + description             = "Managed by Terraform"
      + id                      = (known after apply)
      + name                    = "db-subnet-group"
      + name_prefix             = (known after apply)
      + subnet_ids              = (known after apply)
      + supported_network_types = (known after apply)
      + tags_all                = (known after apply)
      + vpc_id                  = (known after apply)
    }

  # aws_launch_template.web_app will be created
  + resource "aws_launch_template" "web_app" {
      + arn             = (known after apply)
      + default_version = (known after apply)
      + id              = (known after apply)
      + image_id        = "ami-01e3c4a339a264cc9"
      + instance_type   = "t3.micro"
      + latest_version  = (known after apply)
      + name            = (known after apply)
      + name_prefix     = "web-app"
      + tags_all        = (known after apply)
      + user_data       = "IyEvYmluL2Jhc2gKeXVtIC15IGluc3RhbGwgaHR0cGQKZWNobyAiPHA+IEFITCBMb2dpY3MhIDwvcD4iID4+IC92YXIvd3d3L2h0bWwvaW5kZXguaHRtbApzdWRvIHN5c3RlbWN0bCBlbmFibGUgaHR0cGQKc3VkbyBzeXN0ZW1jdGwgc3RhcnQgaHR0cGQK"

      + network_interfaces {
          + associate_public_ip_address = "true"
          + security_groups             = (known after apply)
          + subnet_id                   = (known after apply)
        }
    }

  # aws_lb.web_lb will be created
  + resource "aws_lb" "web_lb" {
      + arn                                                          = (known after apply)
      + arn_suffix                                                   = (known after apply)
      + client_keep_alive                                            = 3600
      + desync_mitigation_mode                                       = "defensive"
      + dns_name                                                     = (known after apply)
      + drop_invalid_header_fields                                   = false
      + enable_deletion_protection                                   = false
      + enable_http2                                                 = true
      + enable_tls_version_and_cipher_suite_headers                  = false
      + enable_waf_fail_open                                         = false
      + enable_xff_client_port                                       = false
      + enforce_security_group_inbound_rules_on_private_link_traffic = (known after apply)
      + id                                                           = (known after apply)
      + idle_timeout                                                 = 60
      + internal                                                     = false
      + ip_address_type                                              = (known after apply)
      + load_balancer_type                                           = "application"
      + name                                                         = "web-lb"
      + name_prefix                                                  = (known after apply)
      + preserve_host_header                                         = false
      + security_groups                                              = (known after apply)
      + subnets                                                      = (known after apply)
      + tags_all                                                     = (known after apply)
      + vpc_id                                                       = (known after apply)
      + xff_header_processing_mode                                   = "append"
      + zone_id                                                      = (known after apply)
    }

  # aws_lb_listener.web_listener will be created
  + resource "aws_lb_listener" "web_listener" {
      + arn               = (known after apply)
      + id                = (known after apply)
      + load_balancer_arn = (known after apply)
      + port              = 80
      + protocol          = "HTTP"
      + ssl_policy        = (known after apply)
      + tags_all          = (known after apply)

      + default_action {
          + order            = (known after apply)
          + target_group_arn = (known after apply)
          + type             = "forward"
        }
    }

  # aws_lb_target_group.web_tg will be created
  + resource "aws_lb_target_group" "web_tg" {
      + arn                                = (known after apply)
      + arn_suffix                         = (known after apply)
      + connection_termination             = (known after apply)
      + deregistration_delay               = "300"
      + id                                 = (known after apply)
      + ip_address_type                    = (known after apply)
      + lambda_multi_value_headers_enabled = false
      + load_balancer_arns                 = (known after apply)
      + load_balancing_algorithm_type      = (known after apply)
      + load_balancing_anomaly_mitigation  = (known after apply)
      + load_balancing_cross_zone_enabled  = (known after apply)
      + name                               = "web-tg"
      + name_prefix                        = (known after apply)
      + port                               = 80
      + preserve_client_ip                 = (known after apply)
      + protocol                           = "HTTP"
      + protocol_version                   = (known after apply)
      + proxy_protocol_v2                  = false
      + slow_start                         = 0
      + tags_all                           = (known after apply)
      + target_type                        = "instance"
      + vpc_id                             = (known after apply)

      + health_check {
          + enabled             = true
          + healthy_threshold   = 3
          + interval            = 30
          + matcher             = (known after apply)
          + path                = "/"
          + port                = "traffic-port"
          + protocol            = "HTTP"
          + timeout             = 5
          + unhealthy_threshold = 2
        }
    }

  # aws_security_group.db_sg will be created
  + resource "aws_security_group" "db_sg" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = []
              + description      = ""
              + from_port        = 5432
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 5432
            },
        ]
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.web_sg will be created
  + resource "aws_security_group" "web_sg" {
      + arn                    = (known after apply)
      + description            = "Managed by Terraform"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + description      = ""
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
        ]
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # aws_sns_topic.alerts will be created
  + resource "aws_sns_topic" "alerts" {
      + arn                         = (known after apply)
      + beginning_archive_time      = (known after apply)
      + content_based_deduplication = false
      + fifo_topic                  = false
      + id                          = (known after apply)
      + name                        = "alerts-topic"
      + name_prefix                 = (known after apply)
      + owner                       = (known after apply)
      + policy                      = (known after apply)
      + signature_version           = (known after apply)
      + tags_all                    = (known after apply)
      + tracing_config              = (known after apply)
    }

  # aws_sns_topic_subscription.email_subscription will be created
  + resource "aws_sns_topic_subscription" "email_subscription" {
      + arn                             = (known after apply)
      + confirmation_timeout_in_minutes = 1
      + confirmation_was_authenticated  = (known after apply)
      + endpoint                        = "khaledtaha.dev2@gmail.com"
      + endpoint_auto_confirms          = false
      + filter_policy_scope             = (known after apply)
      + id                              = (known after apply)
      + owner_id                        = (known after apply)
      + pending_confirmation            = (known after apply)
      + protocol                        = "email"
      + raw_message_delivery            = false
      + topic_arn                       = (known after apply)
    }

  # module.aws-rds-alarms.aws_cloudwatch_metric_alarm.connection_count_anomalous[0] will be created
  + resource "aws_cloudwatch_metric_alarm" "connection_count_anomalous" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "Anomalous database connection count detected. Something unusual is happening."
      + alarm_name                            = "rds-db-anomalousConnectionCount"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanUpperThreshold"
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 5
      + id                                    = (known after apply)
      + ok_actions                            = (known after apply)
      + tags_all                              = (known after apply)
      + threshold_metric_id                   = "e1"
      + treat_missing_data                    = "missing"

      + metric_query {
          + id          = "m1"
          + return_data = true

          + metric {
              + dimensions  = {
                  + "DBInstanceIdentifier" = "db"
                }
              + metric_name = "DatabaseConnections"
              + namespace   = "AWS/RDS"
              + period      = 600
              + stat        = "Average"
              + unit        = "Count"
            }
        }
      + metric_query {
          + expression  = "ANOMALY_DETECTION_BAND(m1, 2)"
          + id          = "e1"
          + label       = "DatabaseConnections (Expected)"
          + return_data = true
        }
    }

  # module.aws-rds-alarms.aws_cloudwatch_metric_alarm.cpu_credit_balance_too_low[0] will be created
  + resource "aws_cloudwatch_metric_alarm" "cpu_credit_balance_too_low" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "Average database CPU credit balance is too low, a negative performance impact is imminent."
      + alarm_name                            = "rds-db-lowCPUCreditBalance"
      + arn                                   = (known after apply)
      + comparison_operator                   = "LessThanThreshold"
      + dimensions                            = {
          + "DBInstanceIdentifier" = "db"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 5
      + id                                    = (known after apply)
      + metric_name                           = "CPUCreditBalance"
      + namespace                             = "AWS/RDS"
      + ok_actions                            = (known after apply)
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 100
      + treat_missing_data                    = "missing"
    }

  # module.aws-rds-alarms.aws_cloudwatch_metric_alarm.cpu_utilization_too_high[0] will be created
  + resource "aws_cloudwatch_metric_alarm" "cpu_utilization_too_high" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "Average database CPU utilization is too high."
      + alarm_name                            = "rds-db-highCPUUtilization"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + dimensions                            = {
          + "DBInstanceIdentifier" = "db"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 5
      + id                                    = (known after apply)
      + metric_name                           = "CPUUtilization"
      + namespace                             = "AWS/RDS"
      + ok_actions                            = (known after apply)
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 90
      + treat_missing_data                    = "missing"
    }

  # module.aws-rds-alarms.aws_cloudwatch_metric_alarm.disk_burst_balance_too_low[0] will be created
  + resource "aws_cloudwatch_metric_alarm" "disk_burst_balance_too_low" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "Average database storage burst balance is too low, a negative performance impact is imminent."
      + alarm_name                            = "rds-db-lowEBSBurstBalance"
      + arn                                   = (known after apply)
      + comparison_operator                   = "LessThanThreshold"
      + dimensions                            = {
          + "DBInstanceIdentifier" = "db"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 5
      + id                                    = (known after apply)
      + metric_name                           = "BurstBalance"
      + namespace                             = "AWS/RDS"
      + ok_actions                            = (known after apply)
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 100
      + treat_missing_data                    = "missing"
    }

  # module.aws-rds-alarms.aws_cloudwatch_metric_alarm.disk_free_storage_space_too_low[0] will be created
  + resource "aws_cloudwatch_metric_alarm" "disk_free_storage_space_too_low" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "Average database free storage space is too low and may fill up soon."
      + alarm_name                            = "rds-db-lowFreeStorageSpace"
      + arn                                   = (known after apply)
      + comparison_operator                   = "LessThanThreshold"
      + dimensions                            = {
          + "DBInstanceIdentifier" = "db"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 5
      + id                                    = (known after apply)
      + metric_name                           = "FreeStorageSpace"
      + namespace                             = "AWS/RDS"
      + ok_actions                            = (known after apply)
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 10000000000
      + treat_missing_data                    = "missing"
    }

  # module.aws-rds-alarms.aws_cloudwatch_metric_alarm.disk_queue_depth_too_high[0] will be created
  + resource "aws_cloudwatch_metric_alarm" "disk_queue_depth_too_high" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "Average database disk queue depth is too high, performance may be negatively impacted."
      + alarm_name                            = "rds-db-highDiskQueueDepth"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + dimensions                            = {
          + "DBInstanceIdentifier" = "db"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 5
      + id                                    = (known after apply)
      + metric_name                           = "DiskQueueDepth"
      + namespace                             = "AWS/RDS"
      + ok_actions                            = (known after apply)
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 64
      + treat_missing_data                    = "missing"
    }

  # module.aws-rds-alarms.aws_cloudwatch_metric_alarm.memory_freeable_too_low[0] will be created
  + resource "aws_cloudwatch_metric_alarm" "memory_freeable_too_low" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "Average database freeable memory is too low, performance may be negatively impacted."
      + alarm_name                            = "rds-db-lowFreeableMemory"
      + arn                                   = (known after apply)
      + comparison_operator                   = "LessThanThreshold"
      + dimensions                            = {
          + "DBInstanceIdentifier" = "db"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 5
      + id                                    = (known after apply)
      + metric_name                           = "FreeableMemory"
      + namespace                             = "AWS/RDS"
      + ok_actions                            = (known after apply)
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 256000000
      + treat_missing_data                    = "missing"
    }

  # module.aws-rds-alarms.aws_cloudwatch_metric_alarm.memory_swap_usage_too_high[0] will be created
  + resource "aws_cloudwatch_metric_alarm" "memory_swap_usage_too_high" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "Average database swap usage is too high, performance may be negatively impacted."
      + alarm_name                            = "rds-db-highSwapUsage"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + dimensions                            = {
          + "DBInstanceIdentifier" = "db"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 5
      + id                                    = (known after apply)
      + metric_name                           = "SwapUsage"
      + namespace                             = "AWS/RDS"
      + ok_actions                            = (known after apply)
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 256000000
      + treat_missing_data                    = "missing"
    }

  # module.aws-rds-alarms.aws_cloudwatch_metric_alarm.read_iops_too_high[0] will be created
  + resource "aws_cloudwatch_metric_alarm" "read_iops_too_high" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "Average Read IO over last 5 minutes too high, performance may suffer"
      + alarm_name                            = "rds-db-read-iops-too-high"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + dimensions                            = {
          + "DBInstanceIdentifier" = "db"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 5
      + id                                    = (known after apply)
      + metric_name                           = "ReadIOPS"
      + namespace                             = "AWS/RDS"
      + ok_actions                            = (known after apply)
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 100
      + treat_missing_data                    = "missing"
    }

  # module.aws-rds-alarms.aws_cloudwatch_metric_alarm.write_iops_too_high[0] will be created
  + resource "aws_cloudwatch_metric_alarm" "write_iops_too_high" {
      + actions_enabled                       = true
      + alarm_actions                         = (known after apply)
      + alarm_description                     = "Average Write IO over last 5 minutes too high, performance may suffer"
      + alarm_name                            = "rds-db-write-iops-too-high"
      + arn                                   = (known after apply)
      + comparison_operator                   = "GreaterThanThreshold"
      + dimensions                            = {
          + "DBInstanceIdentifier" = "db"
        }
      + evaluate_low_sample_count_percentiles = (known after apply)
      + evaluation_periods                    = 5
      + id                                    = (known after apply)
      + metric_name                           = "WriteIOPS"
      + namespace                             = "AWS/RDS"
      + ok_actions                            = (known after apply)
      + period                                = 60
      + statistic                             = "Average"
      + tags_all                              = (known after apply)
      + threshold                             = 10000
      + treat_missing_data                    = "missing"
    }

  # module.vpc.aws_default_network_acl.this[0] will be created
  + resource "aws_default_network_acl" "this" {
      + arn                    = (known after apply)
      + default_network_acl_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + tags                   = {
          + "Name" = "ahl-vpc-default"
        }
      + tags_all               = {
          + "Name" = "ahl-vpc-default"
        }
      + vpc_id                 = (known after apply)

      + egress {
          + action          = "allow"
          + from_port       = 0
          + ipv6_cidr_block = "::/0"
          + protocol        = "-1"
          + rule_no         = 101
          + to_port         = 0
        }
      + egress {
          + action     = "allow"
          + cidr_block = "0.0.0.0/0"
          + from_port  = 0
          + protocol   = "-1"
          + rule_no    = 100
          + to_port    = 0
        }

      + ingress {
          + action          = "allow"
          + from_port       = 0
          + ipv6_cidr_block = "::/0"
          + protocol        = "-1"
          + rule_no         = 101
          + to_port         = 0
        }
      + ingress {
          + action     = "allow"
          + cidr_block = "0.0.0.0/0"
          + from_port  = 0
          + protocol   = "-1"
          + rule_no    = 100
          + to_port    = 0
        }
    }

  # module.vpc.aws_default_route_table.default[0] will be created
  + resource "aws_default_route_table" "default" {
      + arn                    = (known after apply)
      + default_route_table_id = (known after apply)
      + id                     = (known after apply)
      + owner_id               = (known after apply)
      + route                  = (known after apply)
      + tags                   = {
          + "Name" = "ahl-vpc-default"
        }
      + tags_all               = {
          + "Name" = "ahl-vpc-default"
        }
      + vpc_id                 = (known after apply)

      + timeouts {
          + create = "5m"
          + update = "5m"
        }
    }

  # module.vpc.aws_default_security_group.this[0] will be created
  + resource "aws_default_security_group" "this" {
      + arn                    = (known after apply)
      + description            = (known after apply)
      + egress                 = (known after apply)
      + id                     = (known after apply)
      + ingress                = (known after apply)
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Name" = "ahl-vpc-default"
        }
      + tags_all               = {
          + "Name" = "ahl-vpc-default"
        }
      + vpc_id                 = (known after apply)
    }

  # module.vpc.aws_eip.nat[0] will be created
  + resource "aws_eip" "nat" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Name" = "ahl-vpc-us-east-1a"
        }
      + tags_all             = {
          + "Name" = "ahl-vpc-us-east-1a"
        }
      + vpc                  = (known after apply)
    }

  # module.vpc.aws_eip.nat[1] will be created
  + resource "aws_eip" "nat" {
      + allocation_id        = (known after apply)
      + arn                  = (known after apply)
      + association_id       = (known after apply)
      + carrier_ip           = (known after apply)
      + customer_owned_ip    = (known after apply)
      + domain               = "vpc"
      + id                   = (known after apply)
      + instance             = (known after apply)
      + ipam_pool_id         = (known after apply)
      + network_border_group = (known after apply)
      + network_interface    = (known after apply)
      + private_dns          = (known after apply)
      + private_ip           = (known after apply)
      + ptr_record           = (known after apply)
      + public_dns           = (known after apply)
      + public_ip            = (known after apply)
      + public_ipv4_pool     = (known after apply)
      + tags                 = {
          + "Name" = "ahl-vpc-us-east-1b"
        }
      + tags_all             = {
          + "Name" = "ahl-vpc-us-east-1b"
        }
      + vpc                  = (known after apply)
    }

  # module.vpc.aws_internet_gateway.this[0] will be created
  + resource "aws_internet_gateway" "this" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + owner_id = (known after apply)
      + tags     = {
          + "Name" = "ahl-vpc"
        }
      + tags_all = {
          + "Name" = "ahl-vpc"
        }
      + vpc_id   = (known after apply)
    }

  # module.vpc.aws_nat_gateway.this[0] will be created
  + resource "aws_nat_gateway" "this" {
      + allocation_id                      = (known after apply)
      + association_id                     = (known after apply)
      + connectivity_type                  = "public"
      + id                                 = (known after apply)
      + network_interface_id               = (known after apply)
      + private_ip                         = (known after apply)
      + public_ip                          = (known after apply)
      + secondary_private_ip_address_count = (known after apply)
      + secondary_private_ip_addresses     = (known after apply)
      + subnet_id                          = (known after apply)
      + tags                               = {
          + "Name" = "ahl-vpc-us-east-1a"
        }
      + tags_all                           = {
          + "Name" = "ahl-vpc-us-east-1a"
        }
    }

  # module.vpc.aws_nat_gateway.this[1] will be created
  + resource "aws_nat_gateway" "this" {
      + allocation_id                      = (known after apply)
      + association_id                     = (known after apply)
      + connectivity_type                  = "public"
      + id                                 = (known after apply)
      + network_interface_id               = (known after apply)
      + private_ip                         = (known after apply)
      + public_ip                          = (known after apply)
      + secondary_private_ip_address_count = (known after apply)
      + secondary_private_ip_addresses     = (known after apply)
      + subnet_id                          = (known after apply)
      + tags                               = {
          + "Name" = "ahl-vpc-us-east-1b"
        }
      + tags_all                           = {
          + "Name" = "ahl-vpc-us-east-1b"
        }
    }

  # module.vpc.aws_route.private_nat_gateway[0] will be created
  + resource "aws_route" "private_nat_gateway" {
      + destination_cidr_block = "0.0.0.0/0"
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + nat_gateway_id         = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)

      + timeouts {
          + create = "5m"
        }
    }

  # module.vpc.aws_route.private_nat_gateway[1] will be created
  + resource "aws_route" "private_nat_gateway" {
      + destination_cidr_block = "0.0.0.0/0"
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + nat_gateway_id         = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)

      + timeouts {
          + create = "5m"
        }
    }

  # module.vpc.aws_route.public_internet_gateway[0] will be created
  + resource "aws_route" "public_internet_gateway" {
      + destination_cidr_block = "0.0.0.0/0"
      + gateway_id             = (known after apply)
      + id                     = (known after apply)
      + instance_id            = (known after apply)
      + instance_owner_id      = (known after apply)
      + network_interface_id   = (known after apply)
      + origin                 = (known after apply)
      + route_table_id         = (known after apply)
      + state                  = (known after apply)

      + timeouts {
          + create = "5m"
        }
    }

  # module.vpc.aws_route_table.private[0] will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Name" = "ahl-vpc-private-us-east-1a"
        }
      + tags_all         = {
          + "Name" = "ahl-vpc-private-us-east-1a"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table.private[1] will be created
  + resource "aws_route_table" "private" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Name" = "ahl-vpc-private-us-east-1b"
        }
      + tags_all         = {
          + "Name" = "ahl-vpc-private-us-east-1b"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table.public[0] will be created
  + resource "aws_route_table" "public" {
      + arn              = (known after apply)
      + id               = (known after apply)
      + owner_id         = (known after apply)
      + propagating_vgws = (known after apply)
      + route            = (known after apply)
      + tags             = {
          + "Name" = "ahl-vpc-public"
        }
      + tags_all         = {
          + "Name" = "ahl-vpc-public"
        }
      + vpc_id           = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[0] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.private[1] will be created
  + resource "aws_route_table_association" "private" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[0] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_route_table_association.public[1] will be created
  + resource "aws_route_table_association" "public" {
      + id             = (known after apply)
      + route_table_id = (known after apply)
      + subnet_id      = (known after apply)
    }

  # module.vpc.aws_subnet.private[0] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.168.3.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "ahl-vpc-private-us-east-1a"
        }
      + tags_all                                       = {
          + "Name" = "ahl-vpc-private-us-east-1a"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.private[1] will be created
  + resource "aws_subnet" "private" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.168.4.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = false
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "ahl-vpc-private-us-east-1b"
        }
      + tags_all                                       = {
          + "Name" = "ahl-vpc-private-us-east-1b"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public[0] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1a"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.168.1.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "ahl-vpc-public-us-east-1a"
        }
      + tags_all                                       = {
          + "Name" = "ahl-vpc-public-us-east-1a"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_subnet.public[1] will be created
  + resource "aws_subnet" "public" {
      + arn                                            = (known after apply)
      + assign_ipv6_address_on_creation                = false
      + availability_zone                              = "us-east-1b"
      + availability_zone_id                           = (known after apply)
      + cidr_block                                     = "192.168.2.0/24"
      + enable_dns64                                   = false
      + enable_resource_name_dns_a_record_on_launch    = false
      + enable_resource_name_dns_aaaa_record_on_launch = false
      + id                                             = (known after apply)
      + ipv6_cidr_block_association_id                 = (known after apply)
      + ipv6_native                                    = false
      + map_public_ip_on_launch                        = true
      + owner_id                                       = (known after apply)
      + private_dns_hostname_type_on_launch            = (known after apply)
      + tags                                           = {
          + "Name" = "ahl-vpc-public-us-east-1b"
        }
      + tags_all                                       = {
          + "Name" = "ahl-vpc-public-us-east-1b"
        }
      + vpc_id                                         = (known after apply)
    }

  # module.vpc.aws_vpc.this[0] will be created
  + resource "aws_vpc" "this" {
      + arn                                  = (known after apply)
      + cidr_block                           = "192.168.0.0/16"
      + default_network_acl_id               = (known after apply)
      + default_route_table_id               = (known after apply)
      + default_security_group_id            = (known after apply)
      + dhcp_options_id                      = (known after apply)
      + enable_dns_hostnames                 = true
      + enable_dns_support                   = true
      + enable_network_address_usage_metrics = (known after apply)
      + id                                   = (known after apply)
      + instance_tenancy                     = "default"
      + ipv6_association_id                  = (known after apply)
      + ipv6_cidr_block                      = (known after apply)
      + ipv6_cidr_block_network_border_group = (known after apply)
      + main_route_table_id                  = (known after apply)
      + owner_id                             = (known after apply)
      + tags                                 = {
          + "Name" = "ahl-vpc"
        }
      + tags_all                             = {
          + "Name" = "ahl-vpc"
        }
    }

```