variable region {
  type        = string
  description = "provide region"
}

variable vps_cidr {
  type        = string
  default     = ""
  description = "provide vpc"
}

variable ip_on_launch {
  type        = string
  default     = ""
  description = "description"
}

variable subnet1_cidr {
  type        = string
  default     = ""
  description = "provide subnet1 cidr block"
}

variable subnet2_cidr {
  type        = string
  default     = ""
  description = "provide subnet2 block"
}

variable subnet3_cidr {
  type        = string
  default     = ""
  description = "provide subnet3 block"
}

variable subnet4_cidr {
  type        = string
  default     = ""
  description = "provide subnet4 block"
}

variable instance_type {
  type        = string
  default     = ""
  description = "description"
}


variable availability_zones {
  description = "Availability zones for subnets"
  type        = string
}

































variable vpc_cidr {
  type        = string
  description = "provide vpc block"
}

variable subnet1_cidr {
  type        = string
  description = "provide subnet1 block"
}
variable subnet2_cidr {
  type        = string
  description = "provide subnet2 block"
}
variable subnet3_cidr {
  type        = string
  description = "provide subnet3 block"
}

variable subnet4_cidr {
  type        = string
  description = "provide subnet4 block"
}
variable ip_on_lunch {
  type        = bool
 
}
variable instance_type {
  type        = string
  default     = ""
  description = "description"
}