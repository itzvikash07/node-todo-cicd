resource "aws_instance" "web" {
  ami                    = "ami-053b0d53c279acc90"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key-by-tf.key_name
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]

  tags = {
    Name = "Instance-by-tf"
  }
}
resource "aws_key_pair" "key-by-tf" {
  key_name   = "key-by-tf"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "This Security group will allow ports needed to run the application"

  dynamic "ingress" {
    for_each = [22, 3000, 8000, 80, 443]
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  tags = {
    Name = "sg-by-tf"
  }
}