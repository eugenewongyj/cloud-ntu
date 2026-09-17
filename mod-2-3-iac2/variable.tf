variable "instance_type" {
    type = string 
    description = "ec2 instance type"
    default = "t2.micro"
}

variable "name" {
    type = string
    description = "name"
    default = "eugene"
}