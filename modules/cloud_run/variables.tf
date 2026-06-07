variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "name" {
  type = string
}

variable "image" {
  type = string
}

variable "service_account" {
  type = string
}

variable "connector_id" {
  type = string
}

variable "min_instances" {
  type    = number
  default = 1
}

variable "max_instances" {
  type    = number
  default = 10
}

variable "cpu" {
  type    = string
  default = "1"
}

variable "memory" {
  type    = string
  default = "512Mi"
}

variable "port" {
  type    = number
  default = 8080
}

variable "health_check_path" {
  type    = string
  default = "/health"
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "liveness_initial_delay" {
  type    = number
  default = 10
}

variable "liveness_period" {
  type    = number
  default = 30
}

variable "liveness_failure_threshold" {
  type    = number
  default = 3
}

variable "startup_initial_delay" {
  type    = number
  default = 5
}

variable "startup_period" {
  type    = number
  default = 5
}

variable "startup_failure_threshold" {
  type    = number
  default = 10
}

variable "ingress_mode" {
  type    = string
  default = "INGRESS_TRAFFIC_INTERNAL_LOAD_BALANCER"
}

variable "traffic_type" {
  type    = string
  default = "TRAFFIC_TARGET_ALLOCATION_TYPE_LATEST"
}

variable "egress_mode" {
  type    = string
  default = "ALL_TRAFFIC"
}

variable "env_vars" {
  type    = map(string)
  default = {}
}

variable "secret_env_vars" {
  type = map(object({
    secret_name = string
    version     = string
  }))
  default = {}
}