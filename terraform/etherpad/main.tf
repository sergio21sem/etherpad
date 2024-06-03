terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
  backend "s3" {
    endpoint                    = "storage.yandexcloud.net"
    bucket                      = "sergio21sem"
    region                      = "ru-central1"
    key                         = "terraform/etherpad/terraform.tfstate"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_requesting_account_id  = true # Необходимая опция Terraform для версии 1.6.1 и старше.
    skip_s3_checksum            = true #
  }
}

provider "yandex" {
  token     = var.cloud_token
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  app_disk_image  = var.app_disk_image
  subnet_id       = var.subnet_id
}

#  network_interface {
#    # Указан id подсети default-ru-central1-a
#    subnet_id = yandex_vpc_subnet.app-subnet.id
#    nat       = true
#  }
#}
