variable "vpc-cidr" {
  description = "VPC CIDR Range"
  type        = string
}


#subnet variable
variable "subnet-cidr" {
  description = "my subnet CIDR RANGE for subnet 1"
  type        = list(string)
}

#internet gateway name 
variable "gateway-name" {
  description = "Internet Gateway name "
  type        = string
}

#vpc id for security groups
# variable "vpc-id" {
#   description = "VPC ID for security group"
#   type        = string
# }