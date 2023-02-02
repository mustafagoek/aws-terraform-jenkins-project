output "instance_public_ip" {
  value = aws_instance.vm1.public_ip
}

output "ssh_info" {
  value = "ssh -i \"~/.ssh/${var.key_name}.pem\" ec2-user@ec2-${aws_instance.vm1.public_ip}.compute-1.amazonaws.com"
}

