data "aws_ami" "this" {
    most_recent = true
    owners = ["amazon"]
    filter {
        name = "architecture"
        values = ["x86_64"]
    }
}

data "aws_subnet" "selected" {
    filter {
        name = "tag:Name"
        values = ["sctp-vpc-ce13-public-us-east-1a"]
    }
    filter {
        name = "vpc-id"
        values = [data.aws_vpc.selected.id]
    }
}

data "aws_vpc" "selected" {
    filter {
        name = "tag:Name"
        values = ["sctp-vpc-ce13"]
    }
}