variable "ami" {
  default = "ami-04b70fa74e45c3917"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  default = "nv_keys"
}

variable "subnet_id" {
  default = "subnet-07b3ac01cd948455d"
}

variable "iam_instance_profile" {
  default = "SSM_Instanceprofile"
}
