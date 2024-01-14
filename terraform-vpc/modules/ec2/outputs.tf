output "instacne-1" {
  value = aws_instance.my-ec2.*.id
}