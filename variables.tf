variable "aws_region" {
  description = "AWS Region to deploy in"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}

variable "alarms_email" {
  description = "App owner email that will be user to receive alerts"
  default     = "khaledtaha.dev2@gmail.com"
}

variable "image_id" {
  default = "ami-01e3c4a339a264cc9"
}
