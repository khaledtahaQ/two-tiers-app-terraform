resource "aws_cloudwatch_log_group" "error" {
  name = "/aws/rds/instance/${aws_db_instance.db.identifier}/error"
  retention_in_days = "5"
}

resource "aws_cloudwatch_log_group" "web_app_log_group" {
  name = "/aws/web-app-logs"
  retention_in_days = 7
}