variable "project_id"     { type = string }
variable "region"         { type = string }
variable "connector_name" { type = string }
variable "vpc_name"       { type = string }
variable "cidr"           { type = string }
variable "min_throughput" { 
    type = number 
    default = 200 
}
variable "max_throughput" { 
    type = number 
    default = 1000 
}