resource "aws_instance" "tomcat" {
        ami = "ami-0022f774911c1d690"
        instance_type = "t2.nano"
        subnet_id = aws_subnet.tomcat-pri1.id
        key_name = "jfrog"
        user_data = "${file("tomcat-ec2.sh")}"
        tags = {
                Name = join("-", [var.project, "backend-dev-tomcat"])
                Batch = "5AM"
      }
}

