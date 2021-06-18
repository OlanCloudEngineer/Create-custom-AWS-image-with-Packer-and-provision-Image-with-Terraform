output "ip" {
 value = "${aws_instance.olankey.public_ip}"
}
output "ec2instance" {
 value = "${aws_instance.olankey.id}"
}
