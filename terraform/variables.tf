variable "availability_zone" {
  type = "string"
  default = "us-east-1a"
}

variable "vpc_id"{
  type = "string"
  default = "vpc-ae1e56ca"
}

variable "subnet_1a"{
  type = "string"
  default = "subnet-4fd86439"
}

variable "ami_id"{
  type = "string"
  default = "ami-26d5af4c"
}

variable "instance_type"{
  type = "string"
  default = "t2.micro"
}

variable "tags" {
  type = "map"
  default = {
    Cluster = "web"
    Environment = "production"
  }
}
