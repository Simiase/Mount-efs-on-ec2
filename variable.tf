variable "ef_vpc_cidr"{
default = "10.0.0.0/16"
description = "ef_vpc_cidr_block"
type     = string
}



variable "subneta_cidr" {
default     = "10.0.1.0/24"
description = "subneta_cidr_block"
type        = string
}

variable "subnetb_cidr" {
default     = "10.0.2.0/24"
description = "subnetb_cidr_block"
type        = string
}