variable "project"{
type = string
default = "lucky"
}
variable "vpc_cidr" {
	default = "10.1.0.0/16"
}

variable "pub_cidr"{
type = string
 default = "10.1.1.0/24"
}

variable "public_cidr"{
default = "10.1.2.0/24"
}

variable "node-pri1_cidr" {
 default = "10.1.3.0/24"
}
variable "node-pri2_cidr" {
default = "10.1.4.0/24"
}
variable "tomcat-pri1_cidr" {
default = "10.1.5.0/24"
}
variable "tomcat-pri2_cidr" {
default = "10.1.6.0/24"
}

