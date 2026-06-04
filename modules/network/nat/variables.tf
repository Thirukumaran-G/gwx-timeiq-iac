variable "project_id"  { type = string }
variable "region"      { type = string }
variable "router_name" { type = string }
variable "nat_name"    { type = string }
variable "vpc_name"    { type = string }
variable "subnet_name" { type = string }

variable "nat_log_filter" {
  type    = string
  default = "ERRORS_ONLY"
}