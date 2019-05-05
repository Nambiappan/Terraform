variable "acckey" {}
variable "seckey" {}

variable "awsregion" {
  default = "us-east-1"
}

variable "AMIS" {
  type = "map"

  default = {
    us-east-1 = "ami-0080e4c5bc078760e"
    us-east-2 = "ami-0cd3dfa4e37921605"
    us-west-1 = "ami-0019ef04ac50be30f"
    eu-west-3 = "ami-0451ae4fd8dd178f7"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}

variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}
