resource "aws_instance" "web" {
    ami = "ami-0c7217cdde317cfec"
    instance_type = "t3.micro"
    
    tags = {
        Name = "dev"
    }
}

resource "aws_ebs_volume" "extra_volume" {
    availability_zone = aws_instance.web.availability_zone
    size = 1
    type = "gp3"

    tags = {
        Name = "extra-1gb-volume"
    }
}

resource "aws_volume_attachment" "ebs_att" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.extra_volume.id 
    instance_id = aws_instance.web.id 
}