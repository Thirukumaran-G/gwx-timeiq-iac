variable "project_id"     { type = string }
variable "psa_range_name" { type = string }
variable "vpc_self_link"  { type = string }
variable "prefix_length"  { 
    type = number
    default = 24 
}