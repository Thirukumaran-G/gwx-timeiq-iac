variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "name" {
  type = string
}

variable "tier" {
  type = string
}

variable "db_version" {
  type    = string
  default = "POSTGRES_15"
}

variable "db_name" {
  type = string
}

variable "db_user" {
  type = string
}

variable "vpc_self_link" {
  type = string
}

variable "psa_range_name" {
  type = string
}

variable "deletion_protection" {
  type    = bool
  default = true
}

variable "backup_start_time" {
  type    = string
  default = "02:00"
}

variable "transaction_log_days" {
  type    = number
  default = 7
}

variable "retained_backups" {
  type    = number
  default = 14
}

variable "maintenance_day" {
  type    = number
  default = 7
}

variable "maintenance_hour" {
  type    = number
  default = 3
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "password_length" {
  type    = number
  default = 32
}

variable "password_special" {
  type    = bool
  default = true
}

variable "password_override" {
  type    = string
  default = "!#$%&*()-_=+[]{}<>:?"
}

variable "query_string_length" {
  type    = number
  default = 1024
}

variable "availability_type" {
  type    = string
  default = "ZONAL"
}

variable "disk_type" {
  type    = string
  default = "PD_SSD"
}

variable "maintenance_update_track" {
  type    = string
  default = "stable"
}