data "aws_ami" "bastion" {
  most_recent = "true"
  owners      = ["self"]
  
  filter {
    name   = "name"
    values = ["bastion-2021.03.0"]
    
  }
}
