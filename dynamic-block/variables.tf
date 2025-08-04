variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "AMI id of joindevops RHEL9"
}

variable "instance_type" {
  default = "t3.micro"

}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name    = "Roboshop"
    Purpose = "Variables-demo"
  }


}

variable "sg_name" {
  default = "allow-all"

}

variable "sg_description" {
  default = "allow all ports from internet"

}

variable "from_port" {
  default = 0

}

variable "to_port" {
  type    = number
  default = 0

}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]

}

variable "sg_tags" {
  default = {
    Name = "allow-all"
  }

}

variable "environment" {
  default = "prod"

}

variable "instances" {
  # default = {
  #     mongodb = "t3.micro"  #each keyword is assigned for every iteration. you will get each.key and each.value
  #     redis = "t3.micro"
  #     mysql = "t3.small"
  #     rabbitmq = "t3.micro"
  default = ["mongodb", "redis", "mysql", "rabbitmq"]


}

variable "zone_id" {
  default = "Z10308481ZTCFXVPZ89KX"

}

variable "domain_name" {
  default = "deena.fun"

}

variable "ingress_ports" {
  default = [ #list(map)
    {
      from_port = 22
      to_port   = 22
    },
    {
      from_port = 80
      to_port   = 80
    },
    {
      from_port = 8080
      to_port   = 8080
    }
  ]

}