resource "aws_instance" "terraform" {
    count = 2
    ami = var.ami_Id
    subnet_id = var.aws_subnet_id
    key_name = var.key_name
    instance_type = var.instance_type
    associate_public_ip_address = true
    vpc_security_group_ids      = [aws_security_group.VPC_sg.id]
    tags = {
        Name = "Terraform-${count.index + 1}-test"
    }
  
}

resource "aws_security_group" "VPC_sg" {
  name        = "VPC_sg"
  vpc_id      = var.vpc_id
  description = "Example security group for EC2 instance"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# locals{
#   instance_names = toset(["Terraform-1-testing","Terraform-2-testing","Terraform-3-testing"])
# }

# resource "aws_instance" "terraform" {
#     for_each = local.instance_names
#     ami = var.ami_Id
#     key_name = var.key_name
#     instance_type = var.instance_type
#     tags = {
#         Name = each.key
#     }
# }

# # resource "aws_s3_bucket" "terratestbucket123" {
# #     bucket = "terratestingbucket987"
# #     tags = {
# #       Name = "terratestbucket123"
# #       Environment = "Dev"
# #     }
  
# # }

# resource "null_resource" "ssh_ec2" {
#   # count = var.run_provisioners ? 1 : 0
#   connection {
#     type = "ssh"
#     user = var.con_user
#     private_key = file("./serverless_class.pem")
#     host = aws_instance.terraform[count.index].public_ip

#   provisioner "remote-exec" {
#     when = create
#     inline = [ 
#       "echo 'Hello World!'",
#       "sudo apt update",
#       "mkdir test",
#       "ls",
#       "sudo apt install docker.io -y",
#      ]
#   }
# }
# }


