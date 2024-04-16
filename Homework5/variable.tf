variable region {
  type        = string
  description = "provide region"
}
variable vpc_cidr {
  type = list(object({
    cidr_blocks           = string
    dns_s   = bool
    dns_h = bool
  }))
}

variable ip_on_launch {
  type        = bool
}

variable subnet_cidr {
  type        = list(object({
      cidr = string
      subnet_name = string

  }))

  description = "provide subnet1 cidr block"
}


variable instance_type_and_name {
type        = list(object({
  in_type= string
  in_name=string
}))
  description = "provide instance type and name"
}


 variable ports {
  type        = list(number)
  description = "List of ports to open in the security group"
}

variable rt_igw_names {
  type        = list
}




















