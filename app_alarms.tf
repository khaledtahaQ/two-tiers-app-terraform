resource "aws_cloudwatch_metric_alarm" "alb_4xx_errors" {
  alarm_name                = "alb-4xx-errors"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "HTTPCode_ELB_4XX_Count"
  namespace                 = "AWS/ApplicationELB"
  period                    = 300
  statistic                 = "Sum"
  threshold                 = 100
  dimensions = {
    LoadBalancer = aws_lb.web_lb.arn_suffix
  }
  alarm_description         = "the alarm will be triggered if the number of 4xx errors exceeds 100 in 5 minutes"
  alarm_actions             = [aws_sns_topic.alerts.arn]
}

resource "aws_cloudwatch_metric_alarm" "alb_5xx_errors" {
  alarm_name                = "alb-5xx-errors"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "HTTPCode_ELB_5XX_Count"
  namespace                 = "AWS/ApplicationELB"
  period                    = 300
  statistic                 = "Sum"
  threshold                 = 10
  dimensions = {
    LoadBalancer = aws_lb.web_lb.arn_suffix
  }
  alarm_description         = "the alarm will be triggered if the number of 4xx errors exceeds 10 in 5 minutes"
  alarm_actions             = [aws_sns_topic.alerts.arn]
}

resource "aws_cloudwatch_metric_alarm" "alb_unhealthy_host" {
  alarm_name                = "alb-unhealthy-hosts"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "UnHealthyHostCount"
  namespace                 = "AWS/ApplicationELB"
  period                    = 300
  statistic                 = "Average"
  threshold                 = 1
  dimensions = {
    TargetGroup = aws_lb_target_group.web_tg.arn_suffix
    LoadBalancer = aws_lb.web_lb.arn_suffix
  }
  alarm_description         = "the alarm will be triggered if there is at least one unhealthy host"
  alarm_actions             = [aws_sns_topic.alerts.arn]
}

resource "aws_cloudwatch_metric_alarm" "alb_high_response_time" {
  alarm_name                = "alb-high-response-time"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 1
  metric_name               = "TargetResponseTime"
  namespace                 = "AWS/ApplicationELB"
  period                    = 300
  statistic                 = "Average"
  threshold                 = 2
  dimensions = {
    TargetGroup = aws_lb_target_group.web_tg.arn_suffix
    LoadBalancer = aws_lb.web_lb.arn_suffix
  }
  alarm_description         = "the alarm will be triggered if the target response time exceeds 2 seconds"
  alarm_actions             = [aws_sns_topic.alerts.arn]
}
