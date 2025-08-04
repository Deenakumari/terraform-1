resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  #key_name = var.key_name


  tags = var.ec2_tags

  provisioner "local-exec" {
    command = "${self.private_ip} > inventory"
    on_failure = continue #ignoring the errors
  }
  provisioner "local-exec" {
    when    = destroy
    command = "echo 'Destroy-time provisioner'" #this should be run we do destroy
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    #private_key = file("C:/Users/deena/.ssh/deena.pem")

    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx ",
    ]
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx",
      
    ]
  }
}

resource "aws_security_group" "allow_all" {
  name_prefix        = "${var.sg_name}-"
  description = var.sg_description

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}