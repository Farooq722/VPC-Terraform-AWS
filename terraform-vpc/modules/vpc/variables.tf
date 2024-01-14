variable "vpc-cidr" {
  description = "VPC CIDR Range"
  type = string
}

#subnet variable
variable "subnet-cidr" {
  description = "my subnet CIDR RANGE for subnet 1 & 2"
  type = list(string)
}

#subnet names
variable "subnet-names" {
  description = "names of subnets block"
  type = list(string)
  default = [ "publicsubnet1", "publicsubnet2" ]
}


#internet gateway name
variable "gateway-name" {
  description = "Internet Gateway name "
  type = string
}