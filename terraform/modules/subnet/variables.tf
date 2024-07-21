variable "vpc_id" {
}

variable "subnet_cidr" {
}

variable "subnet_cidr_public_2" {
}

variable "subnet_cidr_private_1" {  
}

variable "subnet_cidr_private_2" {
}

variable "availability_zone_1" {
}

variable "availability_zone_2" {
}

variable "database_subnet_1_cidr" {
  description = "The CIDR block for the first database subnet"
  type        = string
}

variable "database_subnet_2_cidr" {
  description = "The CIDR block for the second database subnet"
  type        = string
}
