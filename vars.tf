//this is the variables file and variables must be declared here before using
variable "region" {
  default = "us-east-1"
}
variable "ami" {
  default = "ami-06b263d6ceff0b3dd"
}
variable "private_kay" {
  default = "keypairs/theokey"
}
variable "public_key" {
  default = "keypairs/theokey.pub"
}

variable "vpc_CIDR_block" {
  default = "10.0.0.0/16"
}

variable "private_subnet" {
  default = "10.0.1.0/24"
}
variable "ec-2_type" {
  default = "t2.small"
}
variable "access_key" {

}
variable "secret_key" {

}
variable "ith_ips" {
  type = list(string)
  default = ["111.93.41.42/32","103.134.44.153/32","136.232.14.138/32","103.134.45.199/32","35.168.40.95/32","52.66.143.199/32"]
}
variable "username" {
  default = "theo-user"
}

variable "public_subnet_1" {
  default = "10.0.0.0/24"
}
variable "public_subnet_2" {
  default = "10.0.2.0/24"
}
variable "public_subnet_3" {
  default = "10.0.3.0/24"
}
variable "public_subnet_4" {
  default = "10.0.4.0/24"
}
variable "public_subnet_5" {
  default = "10.0.5.0/24"
}
variable "public_subnet_6" {
  default = "10.0.6.0/24"
}
variable "route_table_CIDR_block" {
  default = "0.0.0.0/0"
}
variable "rds_db_pass_master" {}

variable "rds_db_user_master" {}
variable "rds_backup_retention_period" {
  type = number
  default = 14
}
variable "rds_backup_window" {
  default = "07:00-09:00"
}
variable "theo_db_user" {
  default = "theoLiveDB"
}
variable "rds_instance_class" {
  default = "db.r4.large"
}
variable "s3_policy_file" {
  default = "s3-policy.json"
}
variable "s3_user_policy" {
  default ="s3-user-policy.json"
}
variable "domain_name" {
  default = "beta.executivelaunchpad.net"
}