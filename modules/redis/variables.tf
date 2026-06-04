variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "name" {
  type = string
}

variable "memory_size_gb" {
  type = number
}

variable "redis_version" {
  type    = string
  default = "REDIS_7_0"
}

variable "maxmemory_policy" {
  type    = string
  default = "allkeys-lru"
}

variable "maintenance_day" {
  type    = string
  default = "SUNDAY"
}

variable "maintenance_hour" {
  type    = number
  default = 2
}

variable "vpc_self_link" {
  type = string
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "tier" {
  type    = string
  default = "STANDARD_HA"
}

variable "connect_mode" {
  type    = string
  default = "PRIVATE_SERVICE_ACCESS"
}