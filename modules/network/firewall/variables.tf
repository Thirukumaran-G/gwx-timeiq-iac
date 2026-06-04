variable "project_id"          { type = string }
variable "vpc_name"            { type = string }
variable "internal_cidr"       { type = string }
variable "health_check_ranges" { type = list(string) }
variable "health_check_ports"  { type = list(string) }
variable "iap_cidr"            { type = string }

variable "deny_all_priority"    { 
  type = number
  default = 65534 
 }

variable "internal_priority"    { 
  type = number
  default = 900 
}

variable "health_check_priority" { 
  type = number
  default = 800 
}

variable "iap_priority"         { 
  type = number
  default = 700 
}

variable "iap_ports" {
  type    = list(string)
  default = ["22", "3389"]
}