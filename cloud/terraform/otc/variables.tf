# cloud-init configuration
variable "timezone" {
  default = "UTC"
}

variable "linux_password" {
  #default = "LiNuXuSeRPaSs#"
  description = "Set a password for the default user"
}

# Cloud resources name configuration
variable "secgroup_name" {
  default = "nwx-secgroup"
}

variable "secgroup_desc" {
  default = "T-Pot Security Group"
}

variable "network_name" {
  default = "nwx-network"
}

variable "subnet_name" {
  default = "nwx-subnet"
}

variable "router_name" {
  default = "nwx-router"
}

variable "ecs_prefix" {
  default = "nwx-"
}

# ECS configuration
variable "availability_zone" {
  default = "eu-de-03"
  description = "Select an availability zone"
}

variable "flavor" {
  default = "s2.medium.8"
  description = "Select a compute flavor"
}

variable "key_pair" {
  #default = ""
  description = "Specify your SSH key pair"
}

variable "image_id" {
  default = "fb7b0c9c-8b20-4e3f-832c-ea38c981c282"
  description = "Select a Debian 10 base image id"
}

variable "volume_size" {
  default = "128"
  description = "Set the volume size"
}

# These will go in the generated nwx.conf file
variable "nwx_flavor" {
  default = "STANDARD"
  description = "Specify your nwx flavor [STANDARD, SENSOR, INDUSTRIAL, COLLECTOR, NEXTGEN]"
}

variable "web_user" {
  default = "webuser"
  description = "Set a username for the web user"
}

variable "web_password" {
  #default = "w3b$ecret"
  description = "Set a password for the web user"
}
