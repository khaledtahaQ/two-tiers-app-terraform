# Created Alarms
  # CPU Utilization above 90%
  # Disk space less than 10 GB
  # Freeable memory below 256 MB
  # Swap usage above 256 MB
  # EBS Volume burst balance less than 100
  # Maximum used transaction IDs over 1,000,000,000
  # Disk queue depth above 64 (the number of outstanding IO requests that are waiting to be performed on a disk)


# If the instance type is a T-Series instance type (automatically determind),
# the following alarms are also created:
  # CPU Credit Balance below 100


module "aws-rds-alarms" {
  source            = "lorenzoaiello/rds-alarms/aws"
  version           = "2.4.1"
  db_instance_id    = aws_db_instance.db.identifier
  db_instance_class = "db.t2.micro"
  actions_alarm     = [aws_sns_topic.alerts.arn]
  actions_ok        = [aws_sns_topic.alerts.arn]
}