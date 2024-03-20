variable "region" {
  description = "Aws region"
  type        = string
  default     = "us-east-1"
}
variable "access_key" {
  description = "Aws access key"
  type        = string
  sensitive   = true
}

variable "secret_key" {
  description = "Aws secret key"
  type        = string
  sensitive   = true
}

variable "token" {
  description = "Aws secret key"
  type        = string
  sensitive   = true
}



variable "db_name" {
  description = "rds db name"
  type = string
  default = "MyDB"
}

variable "db_user" {
  description = "rds db user"
  type = string
  default = "rdsuser"
}

variable "db_pass" {
  description = "rds db pass"
  type = string
  default = "zrhERihr8372"
}
