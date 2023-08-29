###ssh vars

variable auth-ssh {
  type = map
  default = {
   serial-port-enable = 1 
   ssh-keys = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQAB..........7+rpzNdyrd/ENdUvPBRzx user@localhost.localdomain"
  }
}

###family vars
variable clickhouse_image_name {
  type = string
  default = "centos-7-2009"
  description = "centos"
}


###yandex_compute_image vars
variable "vm_yc_image" {
  type        = string
  default     = "centos-7-2009"
  description = "centos"
}

###yandex_compute_instance vars

variable "clickhouse_vmname" {
  type        = string
  default     = "netology-develop-platform-clickhouse"
  description = "vmname_clickhouse"
}


variable "clickhouse_resources"{
type = map
default = {
  cores = 2
  memory = 1
  core_fraction = 5
}
}

variable "vector_vmname" {
  type        = string
  default     = "netology-develop-platform-vector"
  description = "vmname_vector"
}

variable "vector_resources"{
type = map
default = {
  cores = 2
  memory = 2
  core_fraction = 20
}
}