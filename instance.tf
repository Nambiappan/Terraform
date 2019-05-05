resource "aws_key_pair" "mykey" {
  key_name   = "mykeyname"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "mytestinstance" {
  ami           = "${lookup(var.AMIS,var.awsregion)}"
  instance_type = "t2.micro"
  key_name      = "${aws_key_pair.mykey.key_name}"

  provisioner "local-exec" {
    command = "echo ${aws_instance.mytestinstance.public_ip} > ipaddress.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install nginx -y",
      "sudo /etc/init.d/nginx start",
    ]
  }

  connection {
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
