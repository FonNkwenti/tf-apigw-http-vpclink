variable "vpc_id" {
  type = string
  //fake
  default = "vpc-123a45b6"
}
variable "private_subnets" {
  type = list(any)
  //fake
  default = [
      "subnet-5432bca1",
      "subnet-1abc2345"
  ]
}

variable "region" {
  type    = string
  default = "us-east-1"
}
variable "account_id" {
  type    = number
  default = 123456789012
}

variable "tag_environment" {
  type    = string
  default = "dev"
}

variable "tag_project" {
  type    = string
  default = "aoa-demo"
}

