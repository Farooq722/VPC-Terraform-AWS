variable "sg-id" {
  description = "SG ID for applicaton load balance "
  type = string
}

variable "subnet-alb" {
  description = "subnets for applciation load balancer"
  type = list(string)
}

variable "vpc-id-tg" {
  description = "vpc id for  applicaton load balance "
  type = string
}

variable "instances" {
  description = "intances for targent group id"
  type = list(string)
}