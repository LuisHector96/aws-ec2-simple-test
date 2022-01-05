locals{
  subnet_id = "subnet-01a49780f20d6058c"
  sg        = "sg-0b0609d0ef3670a66"
}

data "aws_ami" "app_ami" {
    most_recent = true
    owners = ["amazon"]

    filter {
        name = "name"
        values = ["amzn2-ami-hvm*"]
    }
}

resource "aws_instance" "instance_for_test" {
  ami             = data.aws_ami.app_ami.id
  instance_type   = var.instance_type
  subnet_id       = local.subnet_id
  security_groups = [local.sg]
}
