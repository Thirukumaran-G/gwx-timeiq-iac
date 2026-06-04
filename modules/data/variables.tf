variable "project_id" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "env" {
  type = string
}

variable "region" {
  type = string
}

variable "labels" {
  type = map(string)
  default = {

  }
}

variable "artifact_registry_repo" {
  type = string
}

variable "pubsub_topic_id" {
  type = string
}

variable "secret_ids" {
  type = list(string)
}

variable "frontend_bucket_name" {
  type = string
}