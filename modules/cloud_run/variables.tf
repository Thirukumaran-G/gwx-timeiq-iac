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

variable "labels" {
  type    = map(string)
  default = {}
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

# ==================== HEALTH CHECK / PROBE VARIABLES ====================
variable "startup_probe_initial_delay" {
  description = "Startup probe initial delay seconds"
  type        = number
  default     = 10
}

variable "liveness_probe_initial_delay" {
  description = "Liveness probe initial delay seconds"
  type        = number
  default     = 30
}