variable "sg_ids" {
    default = ["sg-018add01db68b1c20"]
  
}
variable "tags" {
    default = {
        Name = "roboshop-cart"
        terraform = true
        environment = "dev"
    }
  
}
variable "instance_type" {
    default = "t3.small"
  
}