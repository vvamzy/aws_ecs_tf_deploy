variable "aws_region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "app_name" {
  description = "Name of the application"
  default     = "candidate-app"
}

variable "db_username" {
  description = "Database username"
  default     = "vamsi"
}

variable "db_password" {
  description = "Database password"
  sensitive   = true
  default     = "vamsivamzy321!"
}

variable "db_name" {
  description = "Database name"
  default     = "mydb"
}