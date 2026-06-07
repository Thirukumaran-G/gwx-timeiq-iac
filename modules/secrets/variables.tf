variable "project_id" {
  type = string
}

variable "prefix" {
  type = string
}

variable "env" {
  type = string
}

variable "db_connection_name" {
  type = string
}

variable "db_user" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "redis_host" {
  type = string
}

variable "redis_port" {
  type = number
}

variable "gemini_api_key" {
  type      = string
  sensitive = true
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "secret_key_length" {
  type    = number
  default = 64
}

variable "db_driver" {
  type    = string
  default = "postgresql+asyncpg"
}

variable "db_host" {
  type = string
}

variable "db_port" {
  type    = string
  default = "5432"
}