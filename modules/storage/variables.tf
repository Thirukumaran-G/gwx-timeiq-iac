variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "frontend_bucket" {
  type = string
}

variable "environment" {
  type = string
}

variable "cors_max_age" {
  type    = number
  default = 3600
}

variable "labels" {
  type    = map(string)
  default = {}
}

variable "cors_origins" {
  type    = list(string)
  default = ["*"]
}

variable "cors_methods" {
  type    = list(string)
  default = ["GET", "HEAD"]
}

variable "cors_headers" {
  type    = list(string)
  default = ["Content-Type", "Cache-Control"]
}

variable "website_index" {
  type    = string
  default = "index.html"
}

variable "website_404" {
  type    = string
  default = "index.html"
}