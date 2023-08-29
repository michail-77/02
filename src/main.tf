resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" centos" {
  family = var.clickhouse_image_name
}

resource "yandex_compute_instance" "clickhouse" {
  name = "${ local.org }-${ local.project }-${ local.instance }-clickhouse"
  platform_id = "standard-v1"
  allow_stopping_for_update = true

  resources {
    cores  = var.clickhouse_resources.cores
    memory = var.clickhouse_resources.memory
    core_fraction = var.clickhouse_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

metadata  =  var.auth-ssh

  }

resource "yandex_compute_instance" "vector" {
  name = "${ local.org }-${ local.project }-${ local.instance }-vector"
  platform_id = "standard-v1"
  allow_stopping_for_update = true

  resources {
    cores  = var.vector_resources.cores
    memory = var.vvector_resources.memory
    core_fraction = var.vector_resources.core_fraction
  }
  
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata  =  var.auth-ssh
  
  
}



