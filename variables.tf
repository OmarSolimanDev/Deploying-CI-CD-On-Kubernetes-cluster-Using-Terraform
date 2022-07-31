variable "project_id" {
  type = string
}
variable "gcp_credentials" {
  type = string
}

variable "region" {
  type        = string
  description = "the default region for the project"
}
variable "vpc_name" {
  type = string
}

variable "managed_subnet_region" {
  type = string
}
variable "restricted_subnet_region" {
  type = string
}

 
variable "managed_subnet_CIDR" {
  type = string
}
variable "restricted_subnet_CIDR" {
  type = string
}

# ----------- Nat-gateway & Cloud router variables -----------
variable "nat_name" {
  type = string
}
variable "router_name" {
  type = string
}

variable "router_region" {
  type = string
}

# ----------- Sercvice Account -----------
variable "sa_id" {
  type = string
}
variable "sa_Dname" {
  type    = string
  default = "bastion-sa@&%!&"
}
