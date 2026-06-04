variable "project_id" { type = string }
variable "vpc_name"   { type = string }
variable "labels"     { 
  type = map(string)
   default = {} 
}