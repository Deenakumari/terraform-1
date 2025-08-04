data "aws_ami" "joindevops" {
  
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
}

output "ami_id" {
  value = data.aws_ami.joindevops.id
}
