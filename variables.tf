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

variable "vpn_ip" {
  description = "VPN Ip address"
  type        = string
  default     = "0.0.0.0"
}