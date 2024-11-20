resource "aws_instance" "TF-ES" {
  depends_on      = [aws_key_pair.HWC-3]
  ami             = "ami-0c9978668f8d55984"
  instance_type   = "t3.medium"
  key_name        = "HWC-3"
  user_data       = data.template_cloudinit_config.user_scripts_ES.rendered
  security_groups = [aws_security_group.TF_security_group.name]
  private_ip      = "172.31.13.1"

  tags = {
    Name = "Elastic"
  }
}

resource "aws_instance" "TF-LS" {
  depends_on      = [aws_key_pair.HWC-3]
  ami             = "ami-0c9978668f8d55984"
  instance_type   = "t3.medium"
  key_name        = "HWC-3"
  user_data       = data.template_cloudinit_config.user_scripts_LS.rendered
  security_groups = [aws_security_group.TF_security_group.name]
  private_ip      = "172.31.13.2"

  tags = {
    Name = "Logstash"
  }
}

resource "aws_key_pair" "HWC-3" {
  key_name   = "HWC-3"
  public_key = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "local_file" "HWC_key" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "HWC"
}


