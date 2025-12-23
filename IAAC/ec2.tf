resource "aws_instance" "ubuntu_test" {
  ami                         = "ami-0e1bed4f06a3b463d"
  instance_type               = "t2.xlarge"
  subnet_id                   = aws_subnet.log_shipper.id
  vpc_security_group_ids      = [aws_security_group.log_shipper.id]
  key_name                    = "testubuntu"
  associate_public_ip_address = true
  iam_instance_profile        = "rstudio"

  tags = {
    Name = "ubuntu-test"
  }

  lifecycle {
    prevent_destroy = true
  }
}