resource "aws_instance" "mesa_7" {
  count         = 2
  ami                    = "ami-04a50faf2a2ec1901"
  instance_type          = "t2.micro"
  tags = {
    Name = "mesa_7_${count.index}"
    Terraform   = "true"

 }
}
resource "aws_security_group" "mesa_7_permitir_ssh" {
  name        = "mesa_7_permitir_ssh"
  description = "Permite SSH"
  ingress {
    description = "SSH to EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "mesa_7_permitir_ssh"
  }
}
