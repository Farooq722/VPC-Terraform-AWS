variable "sg-id" {
  description = "sg id for ec2"
  type        = string
}

variable "subnets" {
  description = "subnets id for ec2 "
  type        = list(string)
}

variable "ec2-names" {
  description = "names for servers (EC2)"
  type        = list(string)
  default     = ["server1", "server2"]
}