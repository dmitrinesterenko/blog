provider "aws" {
  region = "us-east-1"
  allowed_account_ids = ["770534373353"]
}

resource "aws_instance" "aws02" {
    ami = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    provisioner "local-exec" {
        command = "echo ${aws_instance.aws02.private_ip} >> private_ips.txt"
    }
    tags = "${var.tags}"
    subnet_id = "${var.subnet_1a}"
}

resource "aws_volume_attachment" "aws02_ebs_att" {
  device_name = "/dev/sdd"
  volume_id = "${aws_ebs_volume.aws02_storage.id}"
  instance_id = "${aws_instance.aws02.id}"
}

resource "aws_ebs_volume" "aws02_storage" {
    availability_zone = "${var.availability_zone}"
    type = "gp2"
    size = "10"
    encrypted = true
}

resource "aws_efs_file_system" "blog_storage" {
  creation_token = "blog_storage"
  tags {
    Name = "blog_storage"
  }
}

// command = "docker-machine create --url=tcp://${aws_instance.aws02.private_ip}:2376 aws02"
