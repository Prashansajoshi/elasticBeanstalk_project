# variable "prashansa_database_1" {
# }

# variable "prashansa_database_2" {
# }

variable "db_security_group_id" {
}

# variable "database_subnet_1_cidr" {
# }

# variable "database_subnet_2_cidr" {
# }

variable "database_subnet_1_id" {
  description = "The ID of the first database subnet"
  type        = string
}

variable "database_subnet_2_id" {
  description = "The ID of the second database subnet"
  type        = string
}

variable "db_username" {
}

variable "db_password" { 
}

variable "database_name"{
}