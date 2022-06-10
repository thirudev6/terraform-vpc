resource "aws_instance" "node" {
ami = "ami-0022f774911c1d690"
instance_type = "t2.nano"
key_name = "jfrog"
subnet_id = aws_subnet.node-pri1.id
user_data = "${file("node.sh")}"
 tags = {
     Name = join("-", [var.project, "backend-dev"])
     Batch = "5AM"
        }
}
