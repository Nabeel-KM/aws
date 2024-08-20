# output "public_ip" {
#     value = aws_instance.terraform[each.key].public_ip
# }


output "public_ips" {
  value = [for instance in aws_instance.terraform : instance.public_ip]
}

# output "ami-name" {
#     value = aws_instance.terraform.ami
# }

# resource "null_resource" "ssh_provisioner" {
#   count = 2  # Ensure count matches the number of instances or resources you want to provision

#   connection {
#     type        = "ssh"
#     user        = var.con_user
#     private_key = file("./serverless_class.pem")
#     host        = aws_instance.terraform[count.index].public_ip
#   }

#   provisioner "remote-exec" {
#     inline = [
#       "echo 'Hello World!'",
#       "sudo apt update",
#       "mkdir test",
#       "ls",
#       "sudo apt install docker.io -y",
#     ]
#   }
# }

resource "null_resource" "ansible_playbook"{
  count = 2
  triggers =  {
    trigger = aws_instance.terraform[count.index].public_ip
  }
  provisioner "local-exec" {
    working_dir = "/home/nabeel-sarfraz/ansible-playbooks"
    command = "ansible-playbook -i ${aws_instance.terraform[count.index].public_ip}, --private-key ${var.private_key} --user ${var.con_user} nginx.yml" 
    
  }
}
