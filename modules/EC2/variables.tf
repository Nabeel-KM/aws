variable "ami_Id" {
    type = string
    default = "ami-04b70fa74e45c3917"
}
  
variable "instance_type" {  
    type = string
    default = "t2.micro"
}
  
variable "key_name" {
  type        = string
  description = "The name of the SSH key pair"
  default     = "serverless_class"
}

variable "con_user" {
    type = string
    default = "ubuntu"
}
  
variable "private_key" {
    type = string
    //sensitive = true
    default = "~/terraform-course/aws/serverless_class.pem"
}

variable "aws_subnet_id" {
  
}

variable "vpc_id" {
  
}