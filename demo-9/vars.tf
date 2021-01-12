variable "AWS_REGION" {
  default = "eu-central-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1    = "ami-0745d55d209ff6afd"
    us-west-2    = "ami-01f398167e3bba7a0"
    eu-central-1 = "ami-0502e817a62226e03"
  }
}